# class Clearance::UsersController < Clearance::BaseController
class UsersController < Clearance::UsersController
  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: [:create, :new]
    skip_before_action :require_login, only: [:create, :new], raise: false
    skip_before_action :authorize, only: [:create, :new], raise: false

  else
    before_filter :redirect_signed_in_users, only: [:create, :new]
    skip_before_filter :require_login, only: [:create, :new], raise: false
    skip_before_filter :authorize, only: [:create, :new], raise: false
  end

  def new
    @user = user_from_params
    render template: "users/new"
    # render template: "pages/index"
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
      # render template: "pages/index"
    end
  end

  def listings
    user_from_id
    @listings = @user.listings
  end

  def edit
    @user = User.find_by id: params[:id]
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update(user_params)
      redirect_to edit_user_path
    else
      render '/users/edit'
    end
  end

  private

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
      "deprecated. Use `redirect_signed_in_users` instead. " +
      "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
      " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    user_params = params[:user] || Hash.new
    full_name = user_params.delete(:full_name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.full_name = full_name
      user.email = email
      user.password = password
    end
  end

  def user_params
    # params[Clearance.configuration.user_parameter] || Hash.new
    # params[:user].permit(:email, :password, :full_name)
    # params.require(:user).permit(:full_name, :email, :encrypted_password, :password, :confirmation_token, :remember_token)
    params.require(:user).permit(:birthdate, :phone, :avatar, :remove_avatar, :firstname, :lastname, :gender, :full_name, :email, :password)
  end

  def user_from_id
    @user = User.find(params[:id])
  end

  def show
    user_from_current_user
    @listings = @user.listings
    @title = "Welcome #{@user.name}. This is your profile." 
  end

end