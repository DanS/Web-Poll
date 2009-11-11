class RemoveAnswerDataType < ActiveRecord::Migration
  def self.up
    remove_column(:questions, "answer_data_type")
  end

  def self.down
    add_column(:questions, "answer_data_type", :text)
  end
end
