class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])
   current_user = User.find_by_email(params[:email])
   if command.success?
     render json: { auth_token: command.result,
      user_id: current_user.id,
      user_email: current_user.email}
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end
end
