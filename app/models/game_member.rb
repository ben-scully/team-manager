class GameMember < ApplicationRecord
  enum status: [ :active, :inactive ]

  belongs_to :game
  belongs_to :squad_member

  validates :status, presence: true

  def display_name
    "#{game.display_name} | #{squad_member.display_name}"
  end
end
