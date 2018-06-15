require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bounds) }
  end
  describe 'relations' do
    it { should have_many(:blogs) }
    it { should  belong_to(:user) }
  end
end
