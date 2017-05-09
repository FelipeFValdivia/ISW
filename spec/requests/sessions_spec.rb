require 'rails_helper'

Monban.test_mode!

describe 'Sessions endpoints' do
  describe 'POST /sign_in' do
    context 'with existing user' do
      let!(:existing_user) { create(:user) }
      context 'and correct data' do
        it 'returns user and auth_token' do
          user_attributes = {
            user: {
              email: existing_user.email,
              password: existing_user.password_digest
            }
          }
          post "/api/v1/users/sign_in", user_attributes

          expect(response).to have_http_status 200
          expect_response_to_include_user_info existing_user
        end
      end
      context 'and wrong password' do
        it 'fails to login' do
          user_attributes = {
            user: {
              email: existing_user.email,
              password: "wrongpassword"
            }
          }
          post "/api/v1/users/sign_in", user_attributes

          expect(response).to have_http_status 401
        end
      end

      context 'with non-existing user' do
        it 'fails to login' do
          user_attributes = attributes_for(:user, :request_user)
          post "/api/v1/users/sign_in", user: user_attributes

          expect(response).to have_http_status 401
        end
      end
    end
  end

  def expect_response_to_include_user_info (user)
    expect(json_value_at_path('user/email')).to eq user.email
    expect(json_value_at_path('user/authentication_token')).to be
    expect(json_value_at_path('user/authentication_token_expires_at')).to be
  end
end
