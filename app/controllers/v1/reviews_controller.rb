class V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]

  def show
    render json: @user
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end
end
