class AddAnswerDataTypeColumnToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :answer_data_type, :string
  end

  def self.down
    remove_column(:questions, :answer_data_type)
  end
end
