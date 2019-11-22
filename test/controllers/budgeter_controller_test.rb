require 'test_helper'

class BudgeterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get budgeter_index_url
    assert_response :success
  end

end
