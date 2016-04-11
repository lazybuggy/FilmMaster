class MoviesController < ApplicationController


	def index
		@movies = Movie.all

		if params[:search] 
   			 @movies = Movie.search(params[:search])
		  else 
    			@movies = Movie.all
		  end

	end

	def show
		@movies = Movie.find(params[:movie_id])

		@notReviewed = MoviesUser.where(movie_id: params[:movie_id], :user_id => current_user.user_id).empty?

		@rID = MoviesUser.select(:rating_id).where(movie_id: params[:movie_id], :user_id => current_user.user_id).to_a

		if MoviesUser.where(movie_id: params[:movie_id]).count != 0
			@overall = MoviesUser.where(movie_id: params[:movie_id]).sum(:rating) / MoviesUser.where(movie_id: params[:movie_id]).count 
		else
			@overall = 0
		end

		@movies.update(overall_rating: @overall)
		render("show")
	end

end
