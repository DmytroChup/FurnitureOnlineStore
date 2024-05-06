# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  
  def create_chat
    @selected_profile = Producer.find(params[:producer_id])

    if user_signed_in?
      user_id = current_user.id
      producer_id = @selected_profile.id
    else
      flash[:alert] = "You need to be logged in."
      redirect_to '/home/index' and return
    end

    @private_chat = PrivateChat.get_private_chat(user_id, producer_id)

    unless @private_chat
        @private_chat = PrivateChat.create(user: current_user, producer: @selected_profile)
    end

    redirect_to user_private_chat_path(user_id, @private_chat)
  end

  def create_chat_index
    @producers = Producer.all
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])

    # Проверяем, если текущий пароль введен правильно
    return render_error(:current_password, "is invalid") if invalid_current_password?

    # Проверяем, что новый пароль совпадает с подтверждением
    return render_error(:password_confirmation, "doesn't match New password") if password_mismatch?

    respond_to do |format|
      if @user.update(user_params)
        bypass_sign_in(@user) # автоматический вход после обновления пароля
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:user_role, :first_name, :patronymic, :last_name, :phone, :username, :password,
                                 :password_confirmation, :cart_id)
  end

  def invalid_current_password?
    params[:user][:password].present? && !@user.valid_password?(params[:user][:current_password])
  end

  def password_mismatch?
    params[:user][:password].present? && params[:user][:password] != params[:user][:password_confirmation]
  end

  def render_error(attribute, message)
    @user.errors.add(attribute, message)
    respond_to_render_errors
  end

  def respond_to_render_errors
    respond_to do |format|
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end
