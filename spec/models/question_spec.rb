require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

# describe Question do
#   before(:each) do
#     @valid_attributes = {
#       :poll_id => 1,
#       :text => "value for text",
#       :group_id => "value for group_id",
#       :form_field_type => "value for form_field_type",
#       :answer_choices => "value for answer_choices",
#       :field_name => "value for field_name",
#       :position => 1
#     }
#   end
# 
#   it "should create a new instance given valid attributes" do
#     Question.create!(@valid_attributes)
#   end
# 
#   it "should not create a new instance if required attributes are blank" do
#     req_attribs = [:poll_id, :group_id, :text, :form_field_type, :field_name,
#       :position ]
#     for attrib in req_attribs do
#       should be_invalid_without_attrib(Question, attrib, @valid_attributes)
#     end
#   end
# end
