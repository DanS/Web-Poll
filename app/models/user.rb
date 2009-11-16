require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :polls
  has_many :answers
  acts_as_authentic
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :message => 'username has already been taken.
    Please choose a different user username'
  validates_confirmation_of :password
end
