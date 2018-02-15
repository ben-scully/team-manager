class Series < ApplicationRecord
  enum status: [ :active, :inactive ]

  belongs_to :squad
  has_many :games

  validates :status, presence: true
  validates :name, presence: true

  validate :new_series_must_be_active, on: :create

  def new_series_must_be_active
    unless active?
      errors.add(:base, "New Series 'Status' must be 'Active'")
    end
  end

  def display_name
    "#{name}"
  end
end
