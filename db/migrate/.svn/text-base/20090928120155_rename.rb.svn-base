class Rename < ActiveRecord::Migration
  def self.up
    rename_column(:answers, :user_id, :responder_id)
  end

  def self.down
    rename_column(:answers, :responder_id, :user_id)
  end
end
