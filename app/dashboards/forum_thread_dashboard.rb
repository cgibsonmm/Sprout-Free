require "administrate/base_dashboard"

class ForumThreadDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    forum_topic: Field::BelongsTo,
    forum_posts: Field::HasMany,
    id: Field::Number,
    subject: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :forum_topic,
    :forum_posts,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :forum_topic,
    :forum_posts,
    :id,
    :subject,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :forum_topic,
    :forum_posts,
    :subject,
  ].freeze

  # Overwrite this method to customize how forum threads are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(forum_thread)
  #   "ForumThread ##{forum_thread.id}"
  # end
end
