class GameMember < ApplicationRecord
  enum status: [ :active, :inactive ]

  belongs_to :game
  belongs_to :squad_member

  validates :status, presence: true
  validate :new_squad_member_must_be_active, on: :create
  validate :new_squad_member_must_be_unique, on: :create
  validate :cannot_be_multiple_active_squad_members, on: :update, if: :active?

  def new_squad_member_must_be_active
    unless active?
      errors.add(:base, "New Game members Status must be 'Active'")
    end
  end

  def new_squad_member_must_be_unique
    if GameMember.find_by(squad_member: squad_member, game: game, status: status)
      errors.add(:base, "New Game members must be unique")
    end
  end

  def cannot_be_multiple_active_squad_members
    member = GameMember.find_by(squad_member: squad_member, game: game, status: :active)
    if member.present? #if an 'active' member already exists
      if member.id != id # and they aren't THIS record
        errors.add(:base, "You cannot change this Game member record to 'Active' because there is already an 'Active'
           Game member record for this Squad member")
      end
    end
  end

  def display_name
    "#{squad_member.display_name}"
  end
end
