require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:user) { create(:user) }
  subject { build(:favorite, user: user) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:urlToImage) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:content) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
