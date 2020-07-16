require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should validates presence of name' do
      ben = User.new(email: 'ben@server.io', password: 'abcd')
      expect(ben.valid?).to be false
    end

    it 'fails validation with no name expecting a specific message' do
      john = User.new(email: 'john@server.io', password: 'abcd')
      john.valid?
      expect(john.errors[:name]).to include('can\'t be blank')
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:programs)}
  end
end
