class TeamUserRole < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :team_role
end
