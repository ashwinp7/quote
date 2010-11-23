class LikesController < ApplicationController
def update
	
	@note = Note.find(params[:id])
	@like = @note.like
	
end
