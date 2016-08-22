class CitiesController < ApplicationController

  def show
  
    @city = City.friendly.find(params[:id].to_s.downcase)
    render :show
  end

end
