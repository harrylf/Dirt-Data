class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :garden
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def name
    email.split('@')[0]
  end
end
