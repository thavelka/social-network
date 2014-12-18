class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true
  
  has_many :statuses
  
  def full_name()
      "#{first_name} #{last_name}"
  end
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
