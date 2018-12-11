require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    forum_threads: Field::HasMany,
    forum_posts: Field::HasMany,
    likes: Field::HasMany,
    id: Field::Number,
    username: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    last_sign_in_ip: Field::String,
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    unconfirmed_email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    password: PasswordField,
    password_confirmation: PasswordField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :username,
    :forum_threads,
    :forum_posts,
    :likes
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :forum_threads,
    :forum_posts,
    :id,
    :username,
    :email,
    # :encrypted_password,
    # :reset_password_token,
    :reset_password_sent_at,
    # :remember_created_at,
    # :sign_in_count,
    # :last_sign_in_at,
    # :current_sign_in_ip,
    # :last_sign_in_ip,
    # :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    # :unconfirmed_email,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :forum_threads,
    # :forum_posts,
    :username,
    :email,
    :password,
    :password_confirmation,
    # :reset_password_sent_at,
    # :remember_created_at,
    :confirmed_at,
    :confirmation_sent_at,
    # :unconfirmed_email,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
