class V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]
  before_action :check_login, only: %i[create]
  before_action :check_owner, only: %i[update destroy]

  def index
    @review = Review.all
    render json: ReviewSerializer.new(@review).serializable_hash, status: :ok
  end

  def create
    review = current_user.reviews.new(review_params)
    if review.save
      render json: ReviewSerializer.new(review).serializable_hash, status: :created
    else
      render json: { errors: review.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: ReviewSerializer.new(@review).serializable_hash
  end

  def update
    if @review.update(review_params)
      render json: ReviewSerializer.new(@review).serializable_hash
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    head 204
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :score, :airline_id)
  end

  def check_owner
    head :forbidden unless @review.user_id == current_user&.id
  end
end
