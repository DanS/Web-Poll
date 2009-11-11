# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def add_question_link(link_text)
    link_to_function link_text do |page|
      page.insert_html :bottom, :questions, :partial => 'questions/questions', :object => Question.new
    end
  end



  #Ryan Bates helpers for nested forms
  #from http://github.com/ryanb/complex-form-examples/tree/deep
  #using these keeps the javascript escaping charaters from getting out of control

  def remove_child_link(name, f)
    f.hidden_field(:_delete) + link_to_function(name, "remove_fields(this)")
  end

  def add_child_link(name, f, method)
    fields = new_child_fields(f, method)
    link_to_function(name, h("insert_fields_and_assign_positions(this, \"#{method}\", \"#{escape_javascript(fields)}\")"))
    #link_to_function(name, h("insert_fields(this, \"#{method}\", \"#{escape_javascript(fields)}\")"))
  end

  def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end
end