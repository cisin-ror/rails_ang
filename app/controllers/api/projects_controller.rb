class Api::ProjectsController < ApplicationController

  def index
    render status: 200, json: Project.all.as_json
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      render status: 200, json: @project.as_json
    else
      render status: 400, json: { message: "Failed to create project" }
    end 
  end

  private 
    def project_params
      params.require(:project).permit(:name)
    end
end
