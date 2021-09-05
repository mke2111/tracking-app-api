class MeasuresController < ApplicationController
  def index
    measures = Measure.all
    render json: measures
  end

  def show
    measure = Measure.find(params[:id])
    render json: measure
  end

  def create
    measure = Measure.new(measure_params)
    if measure.save
      render json: measure, status: 200
    else
      render json: measure.errors, status: :unprocessable_entity
    end
  end

  private

  def measure_params
    params.permit(:name)
  end
end
