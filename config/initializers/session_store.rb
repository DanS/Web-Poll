# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_webpoll_session',
  :secret      => '4c113af46c78c80b68d97e4694176c1e657b92deef47cb3ceb3e39dba94fbe7897684e49b45f319c2a73a343172261293df6cbeabc44d7c9c8015f5e4a9e34f3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
 ActionController::Base.session_store = :active_record_store
