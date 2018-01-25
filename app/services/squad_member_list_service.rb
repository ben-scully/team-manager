# app/services/invite_list_service.rb

class SquadMemberListService
  def initialize(params)
    @squad_id = params[:squad_id]
  end

  def call
    existing_members + non_members
  end

  private

  def existing_members
    @squad_members ||= SquadMember.where(squad: @squad_id)
  end

  def non_members
    non_member_users = User.where.not(id: existing_members.map(&:user_id))

    non_member_users.map do |user|
      SquadMember.new(squad: nil, user: user)
    end
  end
end
