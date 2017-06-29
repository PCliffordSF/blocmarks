class AddUserNameToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :user_name, :string
  end
end
