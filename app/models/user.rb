class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :stories, dependent: :destroy

  def stories
      Story.where(user_id: self.id)
  end

  def to_s
    name
  end
end

