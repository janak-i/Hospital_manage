class SessionsController < ApplicationController
        def signup
                
                user = User.new(email: params[:email], password: params[:password], role:params[:role], name: params[:name])
                if user.save
                        token =   encode_user_data({ user_data: user.id })
                        UserMailer.welcome_email(user).deliver_now
                        render json: { token: token }
                else
                        render json: { message: "invalid credentials" }
                end
        end


        def login
                user = User.find_by(email: params[:email], password: params[:password])
                if user && user.password == params[:password] && allowed_roles.include?(user.role.to_sym)
                        token = encode_user_data({ user_data: user.id })
                        render json: { token: token }
                else
                        render json: { message: "invalid credentials" }
                end
        end

        private

        def allowed_roles
                [:admin, :patient, :doctor]
        end
end


