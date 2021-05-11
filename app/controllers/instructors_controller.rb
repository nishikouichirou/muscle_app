class InstructorsController < ApplicationController
  before_action :logged_in_instructor, only: [:index, :edit,
                                        :update, :destroy]
  before_action :correct_instructor,   only: [:edit, :update]
  before_action :admin_instructor,     only: :destroy

  # def index
  #   #@users = User.all
  #   @users = User.paginate(page: params[:page])
  # end

  # GET /users/:id
  def show
    @instructor = Instructor.find(params[:id])
    # => app/views/users/show.html.erb
    # debugger
  end

  # GET /users/new
  def new
    @instructor = Instructor.new
    # => form_for @user
  end

  # POST /users
  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save # => Validation
      # Sucess
      instructors_log_in @instructor
      flash[:info] = "登録完了"
      redirect_to @instructor
      # GET "/users/#{@user.id}" => show
    else
      # Failure
      render 'new'
      flash[:info] = "登録失敗"
    end
  end

  # GET /users/:id/edit
  # params[:id] => :id
  def edit
    @instructor = Instructor.find(params[:id])
    # => app/views/users/edit.html.erb
  end

  #PATCH /users/:id
  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(instructor_params)
      # Success
      flash[:success] = "Profile updated"
      redirect_to @instructor
    else
      # Failure
      # => @user.errors.full_messages()
      render 'edit'
    end
  end

  # DELETE /users/:id
  def destroy
    Instructor.find(params[:id]).destroy
    flash[:success] = "Instructor deleted"
    redirect_to instructors_url
  end

  private

    def instructor_params
      params.require(:instructor).permit(
        :name, :email, :password,
        :password_confirmation,:image)
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_instructor
      unless instructors_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # 正しいユーザーかどうか確認
    def correct_instructor
      # GET   /users/:id/edit
      # PATCH /users/:id
      @instructor = Instructor.find(params[:id])
      redirect_to(root_url) unless current_instructor?(@instructor)
    end

end