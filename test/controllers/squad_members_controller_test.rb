require 'test_helper'

class SquadMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad_member = squad_members(:one)
  end

  test "should get index" do
    get squad_members_url
    assert_response :success
  end

  test "should get new" do
    get new_squad_member_url
    assert_response :success
  end

  test "should create squad_member" do
    assert_difference('SquadMember.count') do
      post squad_members_url, params: { squad_member: { squad: @squad_member.squad, user: @squad_member.user } }
    end

    assert_redirected_to squad_member_url(SquadMember.last)
  end

  test "should show squad_member" do
    get squad_member_url(@squad_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_squad_member_url(@squad_member)
    assert_response :success
  end

  test "should update squad_member" do
    patch squad_member_url(@squad_member), params: { squad_member: { squad: @squad_member.squad, user: @squad_member.user } }
    assert_redirected_to squad_member_url(@squad_member)
  end

  test "should destroy squad_member" do
    assert_difference('SquadMember.count', -1) do
      delete squad_member_url(@squad_member)
    end

    assert_redirected_to squad_members_url
  end
end
