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
    @rental = Rental.find(params[:device_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rental }
    end
  end

  # GET /rentals/new
  # GET /rentals/new.json
  def new
    @rental = Rental.new
    @rental_id = params[:id]
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
    @rental = Rental.new(params[:rental])
    respond_to do |format|
      if @rental.save
        RenterMailer.confirmEmail(@rental).deliver
        Rental.emailRenters
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render json: @rental, status: :created, location: @rental }
      else
        format.html { render action: "new" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def return
    @rental =  Rental.try(:where, "device_id = ? and email = ?", params[:device_id], params[:email])
    respond_to do |format|
      if @rental.empty?
        format.html { render action: "return"}
      else
        @rental.destroy
        format.html { redirect_to "index", notice: "Thank you for returning your device!"}
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
    @rental.destroy

    respond_to do |format|
      format.html { redirect_to rentals_url }
      format.json { head :no_content }
    end
  end
end
