class PatientListsController < ApplicationController
  
  def index
    wd = ["日", "月", "火", "水", "木", "金", "土"]
    time = Time.now
    @date = time.strftime("%Y/%m/%d(#{wd[time.wday]})")
    ampm = time.hour < 12 ? "AM" : "PM"
    @time =time.strftime("#{ampm} %I:%M")
    @patient_list = PatientList.new
    @patients = Patient.all.order(:name)
    @questions = Question.where("created_at >= ?", Date.today)
  end

  def new
  end

  def create
    @patient_list = PatientList.new(patient_list_params) 
  end

  private

  def patient_list_params
    params.require(:patient_list).permit(:list).merge(patient_id: params[:patient_id])
  end  

end
