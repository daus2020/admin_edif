class ApartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_building
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  # GET buildings/1/apartments
  def index
    @apartments = @building.apartments
  end

  # GET buildings/1/apartments/1
  def show
  end

  # GET buildings/1/apartments/new
  def new
    @apartment = @building.apartments.build
  end

  # GET buildings/1/apartments/1/edit
  def edit
  end

  # POST buildings/1/apartments
  def create
    @apartment = @building.apartments.build(apartment_params)

    if @apartment.save
      redirect_to(@apartment.building)
      # redirect_to([@apartment.building, @apartment], notice: 'Apartment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT buildings/1/apartments/1
  def update
    if @apartment.update_attributes(apartment_params)
      redirect_to([@apartment.building, @apartment], notice: 'Apartment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE buildings/1/apartments/1
  def destroy
    @apartment.destroy

    redirect_to building_apartments_url(@building)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = current_user.buildings.find(params[:building_id])
    end

    def set_apartment
      @apartment = @building.apartments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def apartment_params
      params.require(:apartment).permit(:number, :status, :building_id)
    end
end
