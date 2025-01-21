class LabReportsController < ApplicationController
  before_action :set_lab_report, only: %i[ show edit update destroy ]

  # GET /lab_reports
  def index
    @lab_reports = LabReport.all
  end

  # GET /lab_reports/1
  def show
  end

  # GET /lab_reports/new
  def new
    @lab_report = LabReport.new
  end

  # GET /lab_reports/1/edit
  def edit
  end

  # POST /lab_reports
  def create
    @lab_report = LabReport.new(lab_report_params)

    if @lab_report.save
      redirect_to @lab_report, notice: "Lab report was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lab_reports/1
  def update
    if @lab_report.update(lab_report_params)
      redirect_to @lab_report, notice: "Lab report was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lab_reports/1
  def destroy
    @lab_report.destroy!
    redirect_to lab_reports_path, notice: "Lab report was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_report
      @lab_report = LabReport.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def lab_report_params
      params.expect(lab_report: [ :title, :description, :grade, :user_id ])
    end
end
