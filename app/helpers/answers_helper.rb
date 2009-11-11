module AnswersHelper

  def answer_table_group_headers(poll)
    name_span_list = [['',1]] + poll.groups.collect {|g| [g.name, g.questions.length]}
    return content_tag(
      'tr', name_span_list.map {|name, span| content_tag('th', name, {:span=>span})}
    )
  end

  def answer_table_sub_headers(poll)
    header_names = %w(responder_id ) +
      poll.groups.by_position.collect do |g|
      (g.questions.by_position).flatten.collect {|q| q.field_name}
    end.flatten
    return header_names.map {|n| content_tag('th', n)}.join("\n")
  end

  def format_answers(question)
    output_string = ''
    if ['options', 'radio_button', 'yes_no'].include?(question.form_field_type)
      output_string += %Q{
      <table>
      <tr>
        <th>Answer</th>
        <th>Count</th>
        <th>Percentage</th>
      </tr>
      }
      ans_hash = {}
      question.answers.map do |ans|
        if ans_hash.keys.include?(ans.answer_text)
          ans_hash[ans.answer_text] += 1
        else
          ans_hash[ans.answer_text] = 1
        end
      end
      total_count = ans_hash.values.sum
      percent_hash = {}
      ans_hash.keys.map do |k|
        percent_hash[k] = ((ans_hash[k].to_f/total_count) * 100).to_i.to_s + '%'
      end
      for key in ans_hash.keys
        output_string += '<tr>' +
          content_tag('td', "#{key}") +
          content_tag('td', "#{ans_hash[key]}") +
          content_tag('td', "#{percent_hash[key]}") +
          '</tr>'
      end
      output_string += "</table>"
    else
      output_string += "<ul>"
      output_string += question.answers.map do |a|
        content_tag('li', a.answer_text) unless a.answer_text.empty?
      end.join("\n")
      output_string += "</ul>"
    end
    return output_string 
  end

end
