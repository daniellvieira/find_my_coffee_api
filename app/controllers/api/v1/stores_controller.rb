class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [:show]

  def index
    lat = params[:latitude].to_f
    lon = params[:longitude].to_f
    return [] if lat.nil? || lon.nil?

    @stores = Store.within(lon.to_f, lat.to_f)
                   .sort_by(&:ratings_average)
                   .reverse
  end

  def show; end

  private

  def set_store
    @store = Store.find_by!(google_place_id: params[:id])
  end
end