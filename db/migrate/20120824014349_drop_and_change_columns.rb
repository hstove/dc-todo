class DropAndChangeColumns < ActiveRecord::Migration
  def self.up
    remove_column(:lists, :user_id)
    remove_column(:tasks, :user_id)
    add_column(:lists, :user_id, :integer)
    add_column(:tasks, :user_id, :integer)
  end

  def self.down
    remove_column(:lists, :user_id)
    remove_column(:tasks, :user_id)
    add_column(:lists, :user_id, :string)
    add_column(:tasks, :user_id, :string)
  end
end
