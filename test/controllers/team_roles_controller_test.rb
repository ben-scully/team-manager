require 'test_helper'

class TeamRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_role = team_roles(:one)
  end

  test "should get index" do
    get team_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_team_role_url
    assert_response :success
  end

  test "should create team_role" do
    assert_difference('TeamRole.count') do
      post team_roles_url, params: { team_role: {  } }
    end

    assert_redirected_to team_role_url(TeamRole.last)
  end

  test "should show team_role" do
    get team_role_url(@team_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_role_url(@team_role)
    assert_response :success
  end

  test "should update team_role" do
    patch team_role_url(@team_role), params: { team_role: {  } }
    assert_redirected_to team_role_url(@team_role)
  end

  test "should destroy team_role" do
    assert_difference('TeamRole.count', -1) do
      delete team_role_url(@team_role)
    end

    assert_redirected_to team_roles_url
  end
end
