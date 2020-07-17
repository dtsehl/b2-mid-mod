class MechanicRidesController < ApplicationController
  def create
    MechanicRide.create!(mechanic_ride_params)
    mechanic_id = params[:mechanic_id]
    redirect_to "/mechanics/#{mechanic_id}"
  end

  private

  def mechanic_ride_params
    params.permit(:mechanic_id, :ride_id)
  end
end
