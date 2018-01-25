class Squad < ApplicationRecord
  has_many :squad_members
  has_many :games

  validates :name, presence: true
  
  def display_name
    "#{name}"
  end
end
