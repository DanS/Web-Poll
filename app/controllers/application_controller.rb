# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'authlogic'

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #before_filter :authorize, :except => [:login, :newaccount]
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :current_user, :current_groups
  
  def current_groups
    session_poll_id = session['poll_id']
    if session_poll_id
      cond = "poll_id = " + session_poll_id.to_s
      Group.find(:all, :conditions => cond, :order => :position)
    else
      []
    end
  end

  def normalize_positions(items_with_position)
    #change a group of records with a position attribute such that the lowest
    #positon value is 1 and the positional value is incremented once for each
    #following record
    current_position = 0
    for item in items_with_position
      item.update_attribute(:position, current_position += 1)
    end
  end


  def move_position(position_increment, position, model, set_of_positions)
    #change order of records with a "position" attribute by swapping position values
    normalize_positions(current_groups)
    position_id_hash = {}
    set_of_positions.map {|g| position_id_hash[g.position] = g.id}
    destination_position = position + position_increment
    if position_id_hash.keys.include? destination_position
      mover = model.find(position_id_hash[position])
      destination = model.find(position_id_hash[destination_position])
      mover.update_attribute(:position, destination.position)
      destination.update_attribute(:position, position)
    end
  end
  
  def ensure_position_assigned(params)
    # ensure that the params hash contains no "position" keys without a value
    @position_count = find_highest_position_value(params['poll'])
    @modified_params = params['poll'].clone
    set_position_values(@modified_params)
    return @modified_params
  end

  protected

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def find_highest_position_value(h)
    #returns largest position value of any "position" key contained within the hash
    hash_string = h.inspect
    p = /(?:"position"=>")(\d+)/
    matches = p.match(hash_string)
    if matches
      position_values = matches.captures
      return position_values.collect {|x| x.to_i}.max
    else
      return 0
    end
  end

  def set_position_values(h)
    #recursively search the hash (h) for "position" keys and set them to
    #integers of increasing value
    h.values.each do |v|
      if h.has_key?('position') && h['position'] == ""
        value = @position_count += 1
        h['position'] = value
      end
      if ['Hash', 'HashWithIndifferentAccess'].include?(v.class.to_s)
        set_position_values(v)
      end
    end
    return h
  end
  
end