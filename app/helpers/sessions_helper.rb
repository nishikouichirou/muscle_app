module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def instructors_log_in(instructor)
    session[:instructor_id] = instructor.id
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def current_instructor?(instructor)
    instructor == current_instructor
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end
  
  def current_instructor
    if (instructor_id = session[:instructor_id])
      @current_instructor ||= Instructor.find_by(id: instructor_id)
    end
  end

  def logged_in?
    !current_user.nil?
  end
  
  def instructors_logged_in?
    !current_instructor.nil?
  end

   # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def instructors_log_out
    session.delete(:instructor_id)
    @current_instructor = nil
  end
  
  # 記憶したURL (もしくはデフォルト値) にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
  
end
