require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:post) }
  end
  describe 'relations' do
    it { should belong_to(:country) }
  end
end
