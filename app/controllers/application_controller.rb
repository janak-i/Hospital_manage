class ApplicationController < ActionController::API
  SECRET = "yoursecretword"


        def authentication
                decode_data = decode_user_data(request.headers["token"])
                user_data = decode_data[0]["user_id"] if decode_data
                user = User.find_by(id: user_data)
                if user
                        return true
                else
                        render json: { message: "Invalid credentials" }
                end
        end


        def encode_user_data(payload)
                JWT.encode(payload, SECRET, "HS256")
        end


        def decode_user_data(token)
                begin
                        JWT.decode(token, SECRET, true, algorithm: "HS256")
                rescue JWT::DecodeError => e
                        puts e
                end
        end
end
