class TeamRole < ApplicationRecord
  has_many :team_user_roles

  def display_name
    "#{name}"
  end
end
