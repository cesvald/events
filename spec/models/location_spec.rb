require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'has a valid factory' do
    expect(build(:location)).to be_valid
  end
  
  it 'is invalid without a name' do
    expect(build(:location, name: nil)).to_not be_valid
  end
  
  it 'is invalid with same name' do
      create(:location)
      l = build(:location)
      expect(l).to_not be_valid
      expect(l.errors[:name]).to include("ya está en uso")
  end
end
