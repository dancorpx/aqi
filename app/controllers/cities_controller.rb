class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def show
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City added'}
      else
        format.html {render :new }
      end
    end
  end

  private
  def city_params
    params.require(:city).permit(:name)
  end
end
