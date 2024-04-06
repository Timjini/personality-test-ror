require 'test_helper'

class PersonalityTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    puts "Testing index action..."
    get personality_test_result_get_url
    assert_response :success
  end

  # Testing for the test results
  test "should calculate personality result" do
    answers = [0, 1, 2, 0, 1]
    get personality_test_result_url(answers: answers)
    assert_response :success

    assert_match /Your personality type is:/, @response.body
    @personality = @response.body
    
    puts "Personality: #{@personality}"
  end
end