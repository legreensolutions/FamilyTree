# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_FamilyTree_session',
  :secret      => '972148fcef015d8126d648c9d1144743ac427b5d45268f7d66e2bac61d8a7b9c361ef462383cac3b015c5a0aac1fdfd5f40d3cd4de4c23571df28da8bbdbfbce'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
