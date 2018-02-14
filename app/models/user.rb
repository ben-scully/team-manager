class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  enum status: [ :active, :inactive ]

  has_many :squad_members

  def display_name
    "#{firstname} #{lastname}"
  end
end
