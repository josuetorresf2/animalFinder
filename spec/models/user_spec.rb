require 'rails_helper'
<<<<<<< HEAD

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
=======
require 'selenium-webdriver'
require_relative '../config/environment'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  user = FactoryBot.create(:user)
  login_as(user, :scope => :user)

user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
user.confirmed_at = Time.now
user.save

>>>>>>> 7f8de3ccd5eede56673aa7d1dd08e43b173bc053
end
