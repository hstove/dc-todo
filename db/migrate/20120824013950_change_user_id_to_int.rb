class ChangeUserIdToInt < ActiveRecord::Migration
  def self.up
    change_column(:lists, :user_id, :integer)
    change_column(:tasks, :user_id, :integer)
  end

  def self.down
    change_column(:lists, :user_id, :string)
    change_column(:tasks, :user_id, :string)
  end
end
