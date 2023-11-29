class RatingsController < ApplicationController
  def index
    # @ratings = Rating.all
    # now it has preloaded all the user objects asscoiated with each rating. no additonal call from backend
    @ratings = Rating.includes(:user , :beer).all
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    # Rating.create params.require(:rating).permit(:score, :beer_id)
    # session[:last_rating] = "#{rating.beer.name} #{rating.score} points"
    # redirect_to ratings_path

    # rating = Rating.new params.require(:rating).permit(:score, :beer_id)
    # rating.user = current_user
    # rating.save
    # redirect_to current_user

    @rating = Rating.new params.require(:rating).permit(:score, :beer_id)
    @rating.user = current_user

    if @rating.save
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    rating = Rating.find params[:id]
    rating.delete if current_user == rating.user
    redirect_to user_path(current_user)
  end
end
