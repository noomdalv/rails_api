require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.first
  end

  test 'should access and create record' do
    post records_path user: {
      id: @user.id,
    },
    record: {
      day: Date.today,
      description: "testing",
    },
    details: {
      user_id: @user.id,
      sleep: "8.0",
      work: "5.30",
      exercise: "1.12",
      leisure: "2.20"
    }
    assert_response :success
  end

end
