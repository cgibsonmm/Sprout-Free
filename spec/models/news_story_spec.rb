require 'rails_helper'

RSpec.describe NewsStory, type: :model do
  
  it{is_expected.to validate_presence_of(:heading)}
  it{is_expected.to validate_presence_of(:body)}
  it{is_expected.to validate_length_of(:body).is_at_least(15)}
end
