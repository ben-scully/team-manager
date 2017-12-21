class TeamUserRole < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :team_role

  def display_name
    "#{team.display_name} / #{user.display_name} / #{team_role.display_name}"
  end
end
