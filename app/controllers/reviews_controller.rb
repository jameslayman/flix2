class ReviewsController < ApplicationController

  before_action :set_movie

  def index
      @reviews = @movies.reviews
  end

  def new
    @review = @movies.reviews.new
  end

  def create
    @review = @movies.reviews.new(review_params)

    if @review.save
      redirect_to movie_reviews_path(@movies), notice: "Your Review Has Been Submitted!"
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:name, :comment, :stars)
  end

  private
    def set_movie
        @movies = Movie.find(params[:movie_id])
    end
end
