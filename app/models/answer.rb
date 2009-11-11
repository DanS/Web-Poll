class Answer < ActiveRecord::Base
  belongs_to :question

  named_scope :by_responder_id, lambda {|id| {:conditions=>{:responder_id=>id}}}
end
