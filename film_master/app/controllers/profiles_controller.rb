class ProfilesController < ApplicationController
  
  def show

  	@profiles = Profile.find(params[:profile_id])
  	@users = User.find(@profiles.user_id)

  	@genres = GenresProfile.where(:profile_id => params[:profile_id])
  	
  	
  end

	def edit

		@profiles = Profile.find(params[:profile_id])
		@users = User.find(@profiles.user_id)
		render("edit")
	end

	def update
		@profiles = Profile.find(params[:profile_id])
		profile_params = params.require(:profile).permit(:gender,:birthday,:language)
		
		if @profiles.update(profile_params)
			redirect_to "/profiles/#{@profiles.profile_id}" 
		else
			render ("edit")
		end
	end

	def new

		@profiles = Profile.new
		render("new")

	end
	def create

		profile_params = params.require(:profile).permit(:profile_id, :user_id, :gender,:birthday,:language)
		@profiles = Profile.new(profile_params)

		if @profiles.update(profile_params)
			redirect_to "/profiles/#{@profiles.profile_id}" 
		else
			render ("new")
		end
	end
  
end
