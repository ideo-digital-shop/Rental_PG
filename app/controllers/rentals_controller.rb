class RentalsController < ApplicationController
  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rentals }
    end
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
    @rental = Rental.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rental }
    end
  end

  # GET /rentals/new
  # GET /rentals/new.json
  def new
    @rental = Rental.new
    @rental_id = params[:rental_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rental }
    end
  end

  # GET /rentals/1/edit
  def edit
    @rental = Rental.find(params[:id])
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)
    @rental.end = Date.strptime(params[:end], "%m/%d/%Y")
    @rental.rate_daily = @rental.device.rate_daily

    respond_to do |format|
      if @rental.save
        RenterMailer.confirmEmail(@rental).deliver
        Rental.emailRenters
        format.html { redirect_to @rental, notice: "Thanks - you're all set!" }
        format.json { render json: @rental, status: :created, location: @rental }
      else
        format.html { render action: "new" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /rentals/1
  # PUT /rentals/1.json
  def update
    @rental = Rental.find(params[:id])

    respond_to do |format|
      if @rental.update_attributes(params[:rental])
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental = Rental.find(params[:id])
    totalDays = (DateTime.now.to_date - @rental.created_at.to_date).to_i
    totalPrice = totalDays * @rental.rate_daily
    RentalRecord.create(
      :email => @rental.email,
      :renter => @rental.renter,
      :device_id => @rental.device_id,
      :total_time => totalDays,
      :rate_daily => @rental.rate_daily,
      :total_price => totalPrice,
      :end => @rental.end
      )
    @rental.destroy

    respond_to do |format|
      format.html { redirect_to :controller => "devices", :action => "index", notice: 'Return successful - Thanks!' }
      format.json { head :no_content }
    end
  end

  # GET /rentals/home
  def home

  end

  private
  def rental_params
      #attr_accessible :device_id, :email, :end, :renter, :comment
    params.require(:rental).permit(:device_id, :email, :end, :renter, :project, :comment)
  end
end
