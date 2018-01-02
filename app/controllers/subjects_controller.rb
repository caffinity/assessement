class SubjectsController < ApplicationController
  before_action :authenticate_teacher!



  def index
    @subject = Subject.all
  end

  def new
    @subjects = Subject.new
  end

  def show
    @subjects = Subject.find(params[:id])
    @skills = Skill.all
  end

  def create
    @subjects = Subject.new(subject_params)
    if @subjects.save
      redirect_to subjects_path
    else
      render 'show'
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

  def set_subject
    @subjects = Subject.find(params[:id])
  end

end
