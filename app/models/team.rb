class Team < ApplicationRecord
  has_many :team_user_roles
  has_many :users, through: :team_user_roles
  has_many :team_roles, through: :team_user_roles
  has_many :team_events
  has_many :events, through: :team_events

  def display_name
    "#{name}"
  end

  def members
    users.distinct
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
    users.where(team_user_roles: {
        team_id: id,
        team_role_id: team_role
        }
      )
  end

  def roles_by_user(user)
    team_roles.where(team_user_roles: {user_id: user})
  end
end
