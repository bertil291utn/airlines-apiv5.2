class V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]
  before_action :check_login, only: %i[create]

  def index
    @review = Review.all
    render json: @review, status: :ok
  end

  def create
    review = current_user.reviews.new(review_params)
    if review.save
      render json: review, status: :created
    else
      render json: { errors: review.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :score, :airline_id)
  end
end
