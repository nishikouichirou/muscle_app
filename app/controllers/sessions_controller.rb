class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    instructor = Instructor.find_by(email: params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    elsif user && !user.authenticate(params[:session][:password])
      flash.now[:danger] = 'メールアドレスとパスワードが一致していません'
      render 'new'
    elsif instructor && instructor.authenticate(params[:session][:password])
      instructors_log_in instructor
      redirect_to root_path
    elsif instructor && !instructor.authenticate(params[:session][:password])
      flash.now[:danger] = 'メールアドレスとパスワードが一致していません'
      render 'new'
    elsif user.nil? && instructor.nil?
      flash.now[:danger] = 'メールアドレスとパスワードが一致していません'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  def instructor_destroy
    instructors_log_out if instructors_logged_in?
    redirect_to root_url
  end
end