class AddImgUrlToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :img_url, :string
  end
end
