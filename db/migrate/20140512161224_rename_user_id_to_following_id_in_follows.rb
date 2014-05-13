class RenameUserIdToFollowingIdInFollows < ActiveRecord::Migration
  def change
    rename_column :follows, :user_id, :following_id
  end
end
