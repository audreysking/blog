class AddUserIdToMiniblogs < ActiveRecord::Migration[5.2]
  def change
    add_column :miniblogs, :user_id, :integer
  end
end
