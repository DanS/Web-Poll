class ChangeAssocsPollsHaveGroupsHaveQuestions < ActiveRecord::Migration
  def self.up
    remove_column(:questions, :poll_id)
  end

  def self.down
    add_column(:questions, :poll_id, :integer)
  end
end
