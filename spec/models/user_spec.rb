# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
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
end
