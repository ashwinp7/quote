class CommentsController < ApplicationController
 def create
    @note = Note.find(params[:note_id])
    @comment = @note.comments.create(params[:comment])
    redirect_to note_path(@note)
  end
end
