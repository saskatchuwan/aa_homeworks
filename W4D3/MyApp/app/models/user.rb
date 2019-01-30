# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  attr_reader :password

  validates :username, :session_token, presence:true
  validates_presence_of :password_digest, :message => "Password can't be blank" 
  #or
  #validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: {minimum: 6, allow_nil: true}

  before_validation :ensure_session_token

  def self.find_by_credentials
    user = User.find_by(username: params[:username])
    if user && BCrypt::Password.new(user.password_digest).is_password?(password)
      return user
    else
      return nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def password=(password_arg)
    @password = password_arg
    self.password_digest = BCrypt::Password.create(password_arg)
  end

end
