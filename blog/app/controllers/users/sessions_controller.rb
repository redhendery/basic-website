class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

@user = User.current_user

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  # protected

  def auth_hash
    request.env['omniauth.auth']
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    sign_out @user
    redirect_to '/'
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
