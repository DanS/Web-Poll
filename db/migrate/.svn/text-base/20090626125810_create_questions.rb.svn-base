class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :poll_id
      t.string :text
      t.integer :group_id
      t.string :form_field_type
      t.string :answer_choices
      t.string :field_name
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
