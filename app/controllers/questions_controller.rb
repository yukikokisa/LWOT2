class QuestionsController < ApplicationController
  before_action :authenticate_patient!, only: [:index, :new]

  def index
    wd = ["日", "月", "火", "水", "木", "金", "土"]
    time = Time.now
    @date = time.strftime("%Y/%m/%d(#{wd[time.wday]})")
    ampm = time.hour < 12 ? "AM" : "PM"
    @time =time.strftime("#{ampm} %I:%M")
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    unless @question.save
      render :new
    end
  end

  private

  def question_params               
    params.require(:question).permit(:consultation_content_id, :date, :subject, :detail).merge(patient_id: current_patient.id)
  end

end
