class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  has_and_belongs_to_many :profiles
  
  [:eventer, :hoster, :admin, :admin_ashram, :admin_morada].each do |name|
    define_method "#{name}?" do
			not profiles.where(name: name).empty?
		end
  end
end