class StudentNotesController < ApplicationController
  def index
  end
  def new
    @student_note = StudentNote.new()
    @student = Student.find(params[:student_id])
  end

  def create
    @student_note = StudentNote.new(student_note_params)
    @student = Student.find(params[:student_id])
    if @student_note.save
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  def edit
    @student_note = StudentNote.find(params[:id])
  end

  def update
    @student_note = StudentNote.find(params[:id])
    if @student_note.update(student_note_params)
      redirect_to student_path(@student_note.student_id)
    else


    end
  end
  def destroy
    @student_note = StudentNote.find(params[:id])
    @student_note.destroy
    redirect_to student_path(@student_note.student_id)
  end

    private
  def student_note_params
    params.require(:student_note).permit(:id, :note, :created_at, :student_id, :created_by)
  end
end
