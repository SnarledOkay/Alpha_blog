class User < ApplicationRecord 
    #'self' refers to each object of the User class
    before_save {self.email = email.downcase}
    has_many :articles, dependent: :destroy
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
        uniqueness: {case_sensitive: false}, 
        length:{maximum: 105},
        format:{with: VALID_EMAIL_REGEX }
    has_secure_password
    validates :password, length:{minimum:6}, allow_nil: true
    #Only checks presence if 'new account' or 'new password is provided'
    validates :password_confirmation, presence: true, if: -> { new_record? || !password.nil? }
end