class SquadMember < ApplicationRecord
  enum status: [ :active, :inactive ]

  belongs_to :user
  belongs_to :squad

  validates :status, presence: true
  validate :new_user_must_be_active, on: :create
  validate :new_user_must_be_unique, on: :create
  validate :cannot_be_multiple_active_users, on: :update, if: :active?

  def new_user_must_be_active
    unless active?
      errors.add(:base, "New Squad members Status must be 'Active'")
    end
  end

  def new_user_must_be_unique
    if SquadMember.find_by(user: user, squad: squad, status: status)
      errors.add(:base, "New Squad members must be unique")
    end
  end

  def cannot_be_multiple_active_users
    if SquadMember.find_by(user: user, squad: squad, status: :active)
      errors.add(:base, "You cannot change this Squad member record to 'Active' because there is already an 'Active' Squad member record for this User")
    end
  end

  def display_name
    "#{squad.display_name} - #{user.display_name}"
  end
end
