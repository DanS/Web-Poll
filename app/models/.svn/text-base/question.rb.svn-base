class Question < ActiveRecord::Base
  validates_presence_of( :text, :form_field_type, :field_name)
  belongs_to :group
  has_many :answers

  named_scope :by_position, :order=>'position ASC'
  named_scope :by_id, :order=>'id ASC'

end
