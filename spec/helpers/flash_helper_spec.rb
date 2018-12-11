require 'rails_helper'

RSpec.describe FlashHelper, type: :helper do
  # Parse Flash
  it 'formats passed flash to bootstrap format' do
    flash = %w[notice success]

    flash.each do |type|
      formated_flash = helper.parse_flash(type)
      expect(formated_flash).to eq('alert-success')
    end

    flash = %w[warning error]

    flash.each do |type|
      formated_flash = helper.parse_flash(type)
      expect(formated_flash).to eq('alert-danger')
    end

    flash = 'other'
    formated_flash = helper.parse_flash(flash)
    expect(formated_flash).to eq('alert-warning')
  end
end
