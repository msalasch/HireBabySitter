class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
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

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        user = @user
        ActionMailMailer.send_email(user).deliver
       format.json { render json: {status: ['Creado Exitosamente,Verifica tu correo']},
       status: :created, location: @user }
        else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def postEmployees
  user = User.where(kind:3)
  end

  def authenticate_user
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  def searchByName
    user = User.where(name:params[:name], kind:3)
    if user
      render json: user
    else
      render json: {errors: ['Name not Found']}
    end
  end

  def searchByLocation
    user = User.where(location:params[:location], kind:3)
    if user
      render json: user
    else
      render json: {errors: ['Not Found']}
    end
  end

  def searchByHour
    user = User.where(hour:params[:hour], kind:3)
    if user
      render json: user
    else
      render json: {errors: ['Not Found']}
    end
  end
  def confirm
       token = params[:token].to_s

       user = User.find_by(confirmation_token: token)

     if user.present? && user.confirmation_token_valid?
        user.mark_as_confirmed!
        render json: {status: 'User confirmed successfully'}, status: :ok
    else
       render json: {status: 'Invalid token'}, status: :not_found
    end
 end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password_digest, :name, :last_name, :phone, :location, :schedule, :hour, :kind)
    end
end
