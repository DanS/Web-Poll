class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :groups
  accepts_nested_attributes_for :groups,
    :reject_if => lambda {|a| a.values.all?(&:blank?) }, :allow_destroy => true

  validates_presence_of  :name, :user_id

  def questions_in_groups
    groups.by_position.collect {|g| {:group_name=>g.name, :questions=>g.questions.by_position}}
  end

  def responder_ids
    #returns a list of all responder_id's for this poll
    return groups.collect do |g|
      (g.questions).flatten.collect do |q|
        (q.answers).flatten.collect do |a|
          (a.responder_id)
        end
      end
    end.flatten.uniq.sort
  end

  def question_ids_by_position
    groups.by_position.collect do |g|
      (g.questions.by_position).flatten.collect {|q| q.id}
    end
  end

  def answers_for_responder_id(responder_id)
    groups.by_position.collect do |g|
      (g.questions.by_position).flatten.collect do |q|
        (q.answers.by_responder_id(responder_id))
      end
    end.flatten 
  end
  
end
