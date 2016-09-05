class SubsectionsController < ApplicationController
  def index
    subsections = Subsection.all
    render json: subsections
  end

  def show
    subsection = Subsection.find(params[:id])
    render json: subsection
  end

  def create
    subsection = Subsection.new(subsection_params)
    if subsection.save
      render json: subsection, status: 201
    else
      render json: {status: "Failed to create subsection"}
    end
  end

  private
    def subsection_params
      params.require(:subsection).permit(:name, :description, :section_id)
    end
end