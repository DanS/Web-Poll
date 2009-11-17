class ChangeAnswerResponderIdType < ActiveRecord::Migration
  def self.up
    change_column :answers, :responder_id, :string
  end

  def self.down
    change_column :answers, :responder_id, :integer
  end
end
