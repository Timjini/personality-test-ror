require "test_helper"

class PersonalityTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index and redirect to session=0" do
    get root_path
    assert_response :redirect
    assert_redirected_to personality_test_path(session: 0)
  end

  test "should clear session and cache and redirect" do
    get clear_session_and_cache_path
    assert_redirected_to personality_test_path(session: 0)
  end

  test "should initiate test" do
    get personality_test_path(session: 0)
    assert_response :success
  end

  test "should go to previous step when session param is missing" do
    # First move to step 1
    get personality_test_path(session: 1)
    assert_response :success

    # Now simulate "back" action by removing session param
    get personality_test_path
    assert_response :redirect
    assert_redirected_to personality_test_path(session: 0)
  end

  test "should progress to next step in result if not last question" do
    post personality_test_result_path, params: { option: 1 }
    assert_response :redirect
  end

  test "should complete test" do
    get personality_test_result_get_path
    assert_response :success
  end
end
