require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest

  test 'should register new user' do
    post registrations_path user: {
      name: "testabc123",
      email: "test@abc123.com",
      password: "abc123",
      password_confirmation: "abc123"
    }
    assert_response :success
  end

  test 'should not register a user with incorrect email format' do
    post registrations_path user: {
      name: "testxyz",
      email: "test@abc123.com",
      password: "xyz123",
      password_confirmation: "xyz123"
      }
    !assert_response :success
  end


end
