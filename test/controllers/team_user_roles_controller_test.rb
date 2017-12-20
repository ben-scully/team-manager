require 'test_helper'

class TeamUserRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_user_role = team_user_roles(:one)
  end

  test "should get index" do
    get team_user_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_team_user_role_url
    assert_response :success
  end

  test "should create team_user_role" do
    assert_difference('TeamUserRole.count') do
      post team_user_roles_url, params: { team_user_role: {  } }
    end

    assert_redirected_to team_user_role_url(TeamUserRole.last)
  end

  test "should show team_user_role" do
    get team_user_role_url(@team_user_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_user_role_url(@team_user_role)
    assert_response :success
  end

  test "should update team_user_role" do
    patch team_user_role_url(@team_user_role), params: { team_user_role: {  } }
    assert_redirected_to team_user_role_url(@team_user_role)
  end

  test "should destroy team_user_role" do
    assert_difference('TeamUserRole.count', -1) do
      delete team_user_role_url(@team_user_role)
    end

    assert_redirected_to team_user_roles_url
  end
end
