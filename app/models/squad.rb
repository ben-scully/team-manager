class Squad < ApplicationRecord
  has_and_belongs_to_many :users

  def display_name
    "#{name}"
  end
end
