class GeneralNotesController < ApplicationController
  def create
    general_note = GeneralNote.new(general_note_params)
    if general_note.save
      render json: general_note, status: 201
    else
      render json: {status: "Failed to create note"}
    end
  end

  private
    def general_note_params
      params.require(:note).permit(:title, :body, :entity_id)
    end
end