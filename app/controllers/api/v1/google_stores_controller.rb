class Api::V1::GoogleStoresController < ApplicationController
  def index
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    render json: GetGoogleCoffeeListService.new(latitude, longitude).call
  end

  def show
    id = params[:id]
    render json: GetGoogleCoffeeDetailsService.new(id).call
  end
end
