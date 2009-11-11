desc 'Print out all defined routes in match order, with names.'
task :routes => :environment do
  routes = ActionController::Routing::Routes.routes.collect do |route|
    name = ActionController::Routing::Routes.named_routes.routes.index(route).to_s
    verb = route.conditions[:method].to_s.upcase
    segs = route.segments.inject("") { |str,s| str << s.to_s }
    segs.chop! if segs.length > 1
    cont, action = route.requirements.empty? ? ['',''] : [route.requirements[:controller], route.requirements[:action]]
    {:name => name, :verb => verb, :segs => segs, :cont => cont, :action => action}
  end
  h = {:name=>'Route Name', :verb=>'Method', :segs=>'Path', :cont=>' Controller', :action => 'Action'}
  name_width = (routes.collect {|r| r[:name]} + [h[:name]]).collect {|n| n.length}.max
  verb_width = (routes.collect {|r| r[:verb]} + [h[:verb]]).collect {|v| v.length}.max
  segs_width = (routes.collect {|r| r[:segs]} + [h[:segs]]).collect {|s| s.length}.max
  cont_width = (routes.collect {|r| r[:cont]} + [h[:cont]]).collect {|c| c.length}.max
  action_width = (routes.collect {|r| r[:action]} + [h[:action]]).collect {|a| a.length}.max
  #column headers
  line_length = name_width + verb_width + segs_width + cont_width + action_width + 7
  puts '-' * line_length
  puts "|#{h[:name].ljust(name_width)}|#{h[:verb].ljust(verb_width)}|#{h[:segs].ljust(segs_width)}|#{h[:cont].ljust(cont_width)} |#{h[:action].ljust(action_width)}|"
  puts '-' * line_length
  routes.each do |r|
    puts "|#{r[:name].ljust(name_width, '.')}|#{r[:verb].ljust(verb_width, '.')}|#{r[:segs].ljust(segs_width, '.')}| #{r[:cont].ljust(cont_width, '.')}|#{r[:action].ljust(action_width, '.')}|"
  end
  puts '-' * line_length
end