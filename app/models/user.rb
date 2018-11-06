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

class User < ApplicationRecord
  rolify
  include ActiveModel::Validations
  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  after_create :assign_default_role
  # Validations
  validates_with UsernameValidator
  username_format = /\A[a-zA-Z]+[a-zA-z0-9]+\z/
  validates :username, format: {with: username_format}
  validates :username, presence: true, length: { in: (3..20) }
  validates :username, uniqueness: true

  # Assosations
  has_many :forum_categories
  has_many :forum_topics, through: :forum_categories
  has_many :forum_threads, through: :forum_topics, dependent: :destroy
  has_many :forum_posts, through: :forum_threads, dependent: :destroy
  has_many :forum_post_photos, dependent: :destroy
  has_many :likes



  def assign_default_role
    self.add_role(:new_user) if self.roles.blank?
  end

  def is_new_user?
    has_role?(:new_user)
  end

  def likes?(post)
    post.likes.where(user_id: id).any?
  end

  def avatar_url
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
