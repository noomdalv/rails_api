require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: 'Vlad',
                        email: 'vlad@luna.com',
                        password: 'abc123',
                        password_confirmation: 'abc123')
  end

  test 'should get root' do
    get root_url
    assert_response :success
  end

  test 'should get create session' do
    post sessions_path user: @user
    assert_response :success
  end

  test 'should get logged_in' do
    post logged_in_url user: @user
    assert_response :success
  end

  test 'should get logout' do
    delete logout_url
    assert_response :success
  end
end
