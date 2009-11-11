class Group < ActiveRecord::Base
  has_many :questions
  belongs_to :poll
  accepts_nested_attributes_for :questions,
    :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true

  named_scope :by_position, :order=>'position ASC'
  named_scope :by_id, :order=>'id ASC'

end