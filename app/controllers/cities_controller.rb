class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
    # @city = City.friendly.find(params[:id].to_s.downcase)
    render :show
  end

end
