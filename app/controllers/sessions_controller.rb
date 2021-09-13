class SessionsController < ApplicationController
  def create
    session = logged_user.sessions.build(session_params)
    session.save if session.valid?
    render json: session
  end

  def show
    session = obtain_session
    render json: session
  end

  def longest
    @session = Session.tasks_total_time(params[:id]).order('total_time DESC').first
    @total_time = @session.total_time if @session.valid?

    render json: @session, total_time: @total_time
  end

  def latest
    @latest_session = Session.tasks_total_time(params[:id]).order('created_at DESC').first
    @total_time = @latest_session.total_time if @latest_session.valid?

    render json: @latest_session, total_time: @total_time
  end

  private

  def session_params
    params.require(:session).permit(:title)
  end

  def obtain_session
    Session.find(params[:id])
  end
end
