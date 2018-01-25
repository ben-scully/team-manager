class Game < ApplicationRecord
  belongs_to :squad
  has_many :game_members

  validates :name, presence: true
  validates :start, presence: true

  def display_name
    "#{name} - #{start.to_formatted_s(:short)}"
  end
end
