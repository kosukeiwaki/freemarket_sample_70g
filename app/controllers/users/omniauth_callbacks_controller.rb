class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    authorization
  end

  # def google_oauth2
  #   authorization
  # end

  def failure
    redirect_to new_registration_path(resource_name)
  end

  private

  def authorization
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      @sns_id = sns_info[:sns].id
      render template: 'devise/registrations/new'
    end
  end
end
