require 'rails_helper'

RSpec.describe ForumCategoriesController, type: :controller do
  it{ is_expected.to validate_persence_of(:title)}
end
