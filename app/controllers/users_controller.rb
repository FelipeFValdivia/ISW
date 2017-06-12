class UsersController < ApplicationController
  before_action :has_expert_permission?, only: [:create_teacher_form, :create_teacher, :teachers_index, :show_teacher]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :student_profile, :show_teacher]
  # GET /users
  # GET /users.json
  def index
    redirect_to workers_users_path
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def student_profile

  end


  # Teachers methods

  def create_teacher_form
    @teacher = User.new(permission_level: "teacher")
  end

  def create_teacher
  	@teacher = User.new(user_params)
  	@teacher.permission_level = "teacher"

  	@teacher.save
  	if @teacher.errors.messages.empty?
  		redirect_to @teacher, notice: "Profesor creado con éxito."
  	else
  		redirect_to create_teacher_form_path, notice: "Hubo un error."
  	end

  end

  def teachers_index
    @teachers = User.where(permission_level: "teacher")
  end

  def show_teacher
    
  end



  # POST /users
  # POST /users.json
  def create
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.update(user_params)
    respond_to do |format|
      if @user.errors.empty?
        format.html {redirect_to student_profile_user_path(id: current_user.id)}
        format.json {respond_with_bip(@user)}
      else
        format.html {redirect_to student_profile_user_path(id: current_user), notice: "existió un error al actualizar"}
        format.json {respond_with_bip(@user)}
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to teachers_users_path, notice: 'Usuario eliminado.'
  end



  private

    def has_expert_permission?
      has_permission?(["expert"])
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_user

      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit( :name, 
                                    :description,
                                    :password, 
                                    :email, 
                                    :permission_level, 
                                    :password_confirmation,
                                    :birth_date)
    end

end
