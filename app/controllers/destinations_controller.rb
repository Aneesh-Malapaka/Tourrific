class DestinationsController < ApplicationController
  before_action :set_destination, only: %i[ show edit update destroy ]

  
  # GET /destinations or /destinations.json
  def index
    puts 
    puts "the params are #{params}"
    @destinations = Destination.where(tour_company_id: current_user.tour_company.id )
    puts "The output is #{@destinations}"
  end

  # GET /destinations/1 or /destinations/1.json
  def show
  end

  # GET /destinations/new
  def new
  
    @destination = current_user.tour_company.destination.build
    # puts "The destination value is: #{@destination.build}"
    @user_now = current_user
        
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations or /destinations.json
  def create
    @destination = current_user.tour_company.destination.build(destination_params)

    respond_to do |format|
      if @destination.save
        format.html { redirect_to tour_company_destinations_url(@destination), notice: "Destination was successfully created." }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1 or /destinations/1.json
  def update
    @destination = Destination.find(params[:id])
    puts "THe dest is #{@destination}"
    puts "The params is #{params.inspect}"
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to tour_company_destinations_url(@destination.tour_company, @destination), notice: "Destination was successfully updated." }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1 or /destinations/1.json
  def destroy
    @destination.destroy!

    respond_to do |format|
      format.html { redirect_to tour_company_destinations_url, notice: "Destination was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
   def destination_params
    params.require(:destination).permit(:id, :dest_name, :rating, :main_image, :tour_company_id, location: [:location_city, :location_state, :location_country, :location_country_code])
   end

end
