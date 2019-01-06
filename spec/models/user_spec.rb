# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  about_me               :text
#  city                   :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  province               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  terms_of_service       :boolean
#  unconfirmed_email      :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates presence of email' do
    record = User.new
    record.email = '' # invalid state
    record.valid? # run validations
    expect(record.errors[:email]).to eq(["can't be blank"]) # check for presence of error

    record.email = 'foo@bar.com' # valid state
    record.valid? # run validations
    expect(record.errors[:email]).not_to eq("can't be blank") # check for absence of error
  end

  it 'validates username format' do
    valid = %w[hello hello1 hello123 h8321123]
    invalid = %w[123_ 328321 hello! this-is !wrong]

    valid.each do |username|
      record = User.new
      record.username = username
      record.valid?
      expect(record.errors[:username]).to eq([])
    end

    invalid.each do |username|
      record = User.new
      record.username = username
      record.valid?
      expect(record.errors[:username]).to eq(['is invalid'])
    end
  end

  it 'validates username against blacklisted names' do
    blacklisted_name = %w[400 admin authentication host sync yourusername]
    record = User.new
    record.username = 'root'
    record.valid?
    expect(record.errors[:username]).to eq(['is blacklisted!'])
  end

  it 'validates user has accepted terms of services' do
    record = User.new
    record.terms_of_service = false
    record.valid?
    expect(record.errors[:terms_of_service]).to eq(['must be accepted'])
  end

  describe 'after creation' do
    it 'sends a conformation mailer' do
      user = FactoryBot.build(:user, confirmed_at: '')

      expect { user.save }.to change(
        Devise.mailer.deliveries, :count
      ).by(3)
    end

    it 'sends the email to the right email' do
      @user = create(:user, confirmed_at: '')

      confirmation_email = Devise.mailer.deliveries.last
      expect(@user.email).to eq confirmation_email.to[0]
    end
  end
end
