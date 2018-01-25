require 'test_helper'

class GameMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_member = game_members(:one)
  end

  test "should get index" do
    get game_members_url
    assert_response :success
  end

  test "should get new" do
    get new_game_member_url
    assert_response :success
  end

  test "should create game_member" do
    assert_difference('GameMember.count') do
      post game_members_url, params: { game_member: { references: @game_member.references, references: @game_member.references } }
    end

    assert_redirected_to game_member_url(GameMember.last)
  end

  test "should show game_member" do
    get game_member_url(@game_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_member_url(@game_member)
    assert_response :success
  end

  test "should update game_member" do
    patch game_member_url(@game_member), params: { game_member: { references: @game_member.references, references: @game_member.references } }
    assert_redirected_to game_member_url(@game_member)
  end

  test "should destroy game_member" do
    assert_difference('GameMember.count', -1) do
      delete game_member_url(@game_member)
    end

    assert_redirected_to game_members_url
  end
end
