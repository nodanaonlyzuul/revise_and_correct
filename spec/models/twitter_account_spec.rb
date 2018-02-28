require 'rails_helper'

RSpec.describe TwitterAccount, type: :model do
  it { is_expected.to validate_presence_of(:screen_name) }
end
