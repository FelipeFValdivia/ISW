class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
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

  def create_teacher_form
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	pp "somethin"
  	@teacher = User.new(permission_level: "teacher")
  end

  def create_teacher
  	@teacher = User.new(user_params)
  	@teacher.permission_level == "teacher"
  	@teacher.save
  	if @teacher.errors.messages.empty?
  		redirect_to @teacher, notice: "Profesor creado con éxito."
  	else
  		pp @teacher.errors
  		redirect_to create_teacher_form_path, notice: "Hubo un error."
  	end

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new user_params.merge(print_shop_id: current_user.print_shop.id)

    @user.save
    if @user.errors.empty?
      redirect_to @user, notice: 'Usuario creado con éxito.'
    else
      flash.now[:success] = @user.errors.full_messages
      render "workers.html.erb"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    if @user.update(user_params)
      if user_params.include?("nick_name")
        @user["email"] = user_params["nick_name"]+"@"+current_user.print_shop.name.gsub(/\s+/, "").downcase
      end
      if current_user.id == @user.id
        redirect_to select_profile_users_path(id: @user.id), notice: 'Tus datos han sido actualizados.'
      else
        respond_to do |format|
          format.html { redirect_to @user, notice: 'Usuario actualizado.' }
          format.json { render json: {} }
        end
      end 
    else
      respond_to do |format|
          format.html { render :edit }
          format.json { render json: {error: @user.errors.full_messages} }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to workers_users_path, notice: 'Usuario eliminado.' }
      format.json { head :no_content }
    end
  end



  private


    # Use callbacks to share common setup or constraints between actions.
    def set_user

      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit( :name, 
                                    :password, 
                                    :email, 
                                    :permission_level, 
                                    :real_email, 
                                    :password_confirmation,
                                    :birth_date)
    end

end
