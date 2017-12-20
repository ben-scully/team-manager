class Team < ApplicationRecord
  has_many :team_user_roles

  def display_name
    "#{name}"
  end

  def members
    @members ||= users.distinct
  end

  def players
    users_by_team_role(TeamRole.find_by(name: 'Player'))
  end

  def managers
    users_by_team_role(TeamRole.find_by(name: 'Manager'))
  end

  def coaches
    users_by_team_role(TeamRole.find_by(name: 'Coach'))
  end

  def users_by_team_role(team_role)
    members.where(team_members: {
        team_id: id,
        team_role_id: team_role
        }
      )
  end
end
