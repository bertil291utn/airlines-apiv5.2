class V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]

  def index
    @review = Review.all
    render json: @review, status: :ok
  end

  def show
    render json: @user
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end
end
