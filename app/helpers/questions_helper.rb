module QuestionsHelper

  def button_arrangement(question)
    #determine if radio buttons should be vertical or horizontal
    length_of_answers = question.answer_choices.split('|').sum {|a| a.length + 4 }
    if (question.text.length + length_of_answers)  > 60
      return 'vertical_buttons'
    else
      return 'horizontal_buttons'
    end
  end
  
end
