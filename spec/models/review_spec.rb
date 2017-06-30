require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of :username }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }

  it { should belong_to :product }
end
