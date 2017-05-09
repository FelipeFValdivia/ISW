require 'rails_helper'

# Source: http://blog.intrepid.io/tutorial-authenticating-a-rails-api

describe 'Users endpoints' do
  describe 'POST /users' do
    context 'with valid email and password' do
      it 'returns JSON for a user' do
        user = attributes_for(:user, :request_user)

        post "/api/v1/users", user: user

        expect(response).to have_http_status :ok
        expect_response_to_include_user_info
      end
    end

    context 'with errors' do
      context 'such as a pre-existing email' do
        it 'returns a 422 response and JSON for errors' do
          existing_user = create(:user)

          user_attributes = {
            user: {
              email: existing_user.email,
              password: user.password_digest
            }
          }

          post "/api/v1/users", user_attributes

          expect(response).to have_http_status :unprocessable_entity
          expect(json_value_at_path('errors/0')).to eq 'Email has already been taken'
        end
      end
      context 'such as no email' do
        it 'returns a 422 response and JSON for errors' do
          user = attributes_for(:user, email: nil)

          post "/api/v1/users", user: user

          expect(response).to have_http_status :unprocessable_entity
          expect(json_value_at_path('errors/0')).to eq "Email can't be blank"
        end
      end
      context 'such as no password' do
        it 'returns a 422 response and JSON for errors' do
          user = attributes_for(:user, :request_user, password: nil)

          post "/api/v1/users", user: user

          expect(response).to have_http_status :unprocessable_entity
          expect(json_value_at_path('errors/0')).to eq "Password can't be blank"
        end
      end
    end
  end

  def user
    User.last
  end

  def expect_response_to_include_user_info
    expect(json_value_at_path('user/email')).to eq user.email
    expect(json_value_at_path('user/authentication_token')).to be
    expect(json_value_at_path('user/authentication_token_expires_at')).to be
  end
end
