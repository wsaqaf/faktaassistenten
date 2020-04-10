class User < ApplicationRecord
  has_many :claims
  has_many :srcs
  has_many :media
  has_many :claim_reviews
  has_many :medium_reviews
  has_many :src_reviews
  has_many :resources

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

   def self.current_user
     Thread.current[:user]
   end

   def self.current_user=(user)
     Thread.current[:user] = user
   end
end
