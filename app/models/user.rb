class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animals

  # attr_accessor :login

  # def login
  #   @login || self.name || self.email
  # end

  # def self.find_for_database_authentication(warden_condition)
  #   conditions = warden_condition.dup
  #   if(login = conditions.delete(:login))
  #     where(conditions.to_h).where(["lower(name) = :value OR lower(email) = :value", { value: login.downcase }]).first
  #   elsif conditions.has_key?(:name) || conditions.has_key?(:email)
  #     (:email)
  #     where(conditions.to_h).first
  #   end
  # end

end
