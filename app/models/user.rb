class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :user_name,
    :location, :address, :phone, :user_type, :paymaent
  # attr_accessible :title, :body
  has_many :authentications, :dependent => :destroy
  has_many :videos, :dependent => :destroy

  validates_presence_of :user_type, :user_name
  validates_uniqueness_of :user_name

  after_create :assign_role_to_user

  USER_TYPE = ["athlete", "coach"]

  def apply_omniauth(auth)
	  # In previous omniauth, 'user_info' was used in place of 'raw_info'
	  self.email = auth['extra']['raw_info']['email']
	  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
	  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
	end

  def assign_role_to_user
    user = self
    user.add_role :athlete if user.user_type == 'athlete'
    user.add_role :coach if user.user_type == 'coach'
  end
end
