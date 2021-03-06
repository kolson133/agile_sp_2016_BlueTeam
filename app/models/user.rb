class User < ActiveRecord::Base
  has_many :decks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2]

  def self.from_omniauth(auth)
    if auth.provider == "facebook"
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    elsif auth.provider == "twitter"
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.nickname << "@twitter.com"
        user.password = Devise.friendly_token[0,20]
      end
    else
      data = auth.info
      user = User.where(:email => data["email"]).first
      unless user
        user = User.create(name: data["name"],
          email: data["email"],
          password: Devise.friendly_token[0,20],
          provider: "Google")
      end
      user
    end
  end
  
end