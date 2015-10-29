require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(provider: provider, user_code: user_id, name: name, email: email) }
  let(:provider) {"google"}
  let(:user_id) {"2weq134erddwe333"}
  let(:name) {"Olaide"}
  let(:email) {"olaide@matflights.com"}

  describe ".save_info"  do
    it {is_expected.to be_valid}
  end

  describe ".save_info"  do
    let(:user_id) {nil}
    it {is_expected.to be_invalid}
  end

end