require 'rails_helper'

RSpec.describe Project, type: :model do
  
  describe 'associations' do
    it { should have_many(:task) }
  end

  describe "validations" do
     it { should validate_presence_of(:name) }
  end

end