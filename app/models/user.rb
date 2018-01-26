class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :squad_members

  # has_many :squads, -> squad_members.map { |x| x.squad }

  def display_name
    "#{firstname} #{lastname}"
  end
end
