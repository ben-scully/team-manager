class Game < ApplicationRecord
  enum status: [ :active, :inactive ]

  belongs_to :series
  has_many :game_members

  validates :name, presence: true
  validates :start, presence: true
  validates :status, presence: true
  validate :new_game_must_be_active, on: :create

  def new_game_must_be_active
    unless active?
      errors.add(:base, "New Game 'Status' must be 'Active'")
    end
  end

  def display_name
    "#{name} - #{start.to_formatted_s(:short)}"
  end
end
