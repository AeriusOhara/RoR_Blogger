class TagsController < ApplicationController
	before_action :require_login, only: [:destroy]

	def require_login
		if logged_in?
			return true
		else
			redirect_to login_path
		end
	end

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		deletedTagName = @tag.name
		flash.notice = "The tag(#{deletedTagName}) was deleted."
		@tag.destroy

		redirect_to tags_path
	end
end