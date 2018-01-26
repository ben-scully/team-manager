class Squad < ApplicationRecord
  enum status: [ :active, :inactive ]
  
  has_many :squad_members
  has_many :games

  validates :name, presence: true

  def display_name
    "#{name}"
  end
end
