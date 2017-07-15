class AddIFrameToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :i_frame, :string
  end
end
