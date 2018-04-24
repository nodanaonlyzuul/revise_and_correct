require 'rails_helper'

RSpec.describe User, type: :model do
  it {  is_expected.to validate_presence_of :name }
  it {  is_expected.to validate_presence_of :screen_name }
  it {  is_expected.to validate_presence_of :email }

  describe 'with_twitter_credentials' do
    before :each do
      User.destroy_all
    end

    it 'Will return 0 for a new user' do
      create(:user)
      expect(User.with_twitter_credentials.count).to eq(0)
    end

    it 'Will return users with Twitter credentials' do
      user = create(:user, key: 'aqui', secret: 'mrroboto')
      expect(User.with_twitter_credentials.count).to eq(1)
      expect(User.with_twitter_credentials.first).to eq(user)
    end
  end
end
