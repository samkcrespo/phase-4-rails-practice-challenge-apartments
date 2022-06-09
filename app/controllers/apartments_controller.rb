class ApartmentsController < ApplicationController

  def index
    apartments = Apartment.all
    render json: apartments
  end

  def show
    apartment = find_apt
    render json: apartment
  end

  def create
    apartment = Apartment.create!(apt_params)
    render json: apartment, status: :created
  end

  def update
    apartment = find_apt
    apartment.update!(apt_params)
    render json: apartment, status: :created
  end
  
  def destroy
    apartment = find_apt
    apartment.destroy
    head :no_content
  end

  private

  def find_apt
    Apartment.find(params[:id])
  end

  def apt_params
    params.permit(:number)
  end
end
