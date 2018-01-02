class SkillsController < ApplicationController

  def show

  end

  def index

  end

  def new
    @skill = Skill.new
    @subject = Subject.find(params[:subject_id])
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @skill = Skill.new
    binding.pry
    if @skill.save
      redirect_to 'show'
    else
      render 'index'
      binding.pry
    end
  end

  private

  def skills_params
    params.require(:skill).permit(:name)
  end
end
