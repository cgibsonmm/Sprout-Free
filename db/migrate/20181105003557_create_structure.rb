class CreateStructure < ActiveRecord::Migration[5.2]
  def change
    create_table "forum_Threads" do |t|
      t.integer "user_id", foreign_key: true
      t.string "subject"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "forum_topic_id", foreign_key: true
    end

    create_table "forum_categories" do |t|
      t.string "title"
      t.integer "user_id", foreign_key: true
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_forum_categories_on_user_id"
    end

    create_table "forum_posts" do |t|
      t.integer "forum_thread_id", foreign_key: true
      t.integer "user_id", foreign_key: true
      t.text "body"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "forum_topics" do |t|
      t.string "title"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "position"
      t.integer "forum_category_id", foreign_key: true
      t.integer "user_id", foreign_key: true
    end

    create_table "images" do |t|
      t.text "image_data"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "roles" do |t|
      t.string "name"
      t.string "resource_type"
      t.integer "resource_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
      t.index ["name"], name: "index_roles_on_name"
      t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
    end

    create_table "users" do |t|
      t.string "username", default: "", null: false
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "last_sign_in_at"
      t.string "current_sign_in_ip"
      t.string "last_sign_in_ip"
      t.string "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string "unconfirmed_email"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
      t.index ["username"], name: "index_users_on_username", unique: true
    end

    create_table "users_roles", id: false do |t|
      t.integer "user_id"
      t.integer "role_id"
      t.index ["role_id"], name: "index_users_roles_on_role_id"
      t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
      t.index ["user_id"], name: "index_users_roles_on_user_id"
    end
  end
end
