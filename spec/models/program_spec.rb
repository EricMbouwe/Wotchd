require 'rails_helper'

RSpec.describe Program, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:group).optional(true) }
  end
end
