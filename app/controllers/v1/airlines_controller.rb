class V1::AirlinesController < ApplicationController
  def index
    @airlines = Airline.all
    render json: @airlines, status: :ok
  end

  def create
    @airline = Airline.new(airline_params)

    @airline.save
    render json: @airline, status: :created
  end

  def show
    @airline = Airline.find(params[:id])

    render json: @airline, status: :ok
  end

  def destroy
    @airline = Airline.where(id: paramas[:id]).first
    head(:unprocessable_entity) unless @airline.destroy

    head(:ok)
  end

  private

  def airline_params
    params.require(:airline).permit(:name, :image_url)
  end
end
