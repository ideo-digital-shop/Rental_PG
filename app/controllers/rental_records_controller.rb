class RentalRecordsController < ApplicationController
  # GET /rental_records
  # GET /rental_records.json
  def index
    @rental_records = RentalRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rental_records }
    end
  end

  # GET /rental_records/1
  # GET /rental_records/1.json
  def show
    @rental_record = RentalRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rental_record }
    end
  end

  # GET /rental_records/new
  # GET /rental_records/new.json
  def new
    @rental_record = RentalRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rental_record }
    end
  end

  # GET /rental_records/1/edit
  def edit
    @rental_record = RentalRecord.find(params[:id])
  end

  # POST /rental_records
  # POST /rental_records.json
  def create
    @rental_record = RentalRecord.new(params[:rental_record])

    respond_to do |format|
      if @rental_record.save
        format.html { redirect_to @rental_record, notice: 'Rental record was successfully created.' }
        format.json { render json: @rental_record, status: :created, location: @rental_record }
      else
        format.html { render action: "new" }
        format.json { render json: @rental_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rental_records/1
  # PUT /rental_records/1.json
  def update
    @rental_record = RentalRecord.find(params[:id])

    respond_to do |format|
      if @rental_record.update_attributes(params[:rental_record])
        format.html { redirect_to @rental_record, notice: 'Rental record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rental_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_records/1
  # DELETE /rental_records/1.json
  def destroy
    @rental_record = RentalRecord.find(params[:id])
    @rental_record.destroy

    respond_to do |format|
      format.html { redirect_to rental_records_url }
      format.json { head :no_content }
    end
  end
end
