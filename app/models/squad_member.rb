class SquadMember < ApplicationRecord
  enum status: [ :active, :inactive ]

  belongs_to :user
  belongs_to :squad

  validates :status, presence: true

  def display_name
    "#{squad.display_name} - #{user.display_name}"
  end
end
