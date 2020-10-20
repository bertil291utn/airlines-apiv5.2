class V1::AirlinesController < ApplicationController
  before_action :set_airline, only: %i[show update destroy]

  def index
    @airlines = Airline.all
    render json: @airlines, status: :ok
  end

  def create
    @airline = Airline.new(airline_params)

    if @airline.save
      render json: @airline, status: :created
    else
      render json: @airline.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @airline, status: :ok
  end

  def update
    if @airline.update(airline_params)
      render json: @airline, status: :created
    else
      render json: @airline.errors, status: :unprocessable_entity
    end
  end

  def destroy
    head(:unprocessable_entity) unless @airline.destroy

    head(:ok)
  end

  def set_airline
    @airline = Airline.find(params[:id])
  end

  private

  def airline_params
    params.require(:airline).permit(:name, :image_url)
  end
end
