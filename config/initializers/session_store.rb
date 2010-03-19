# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_p2_session',
  :secret      => '30ece2706bc4e65fc3168be7b4110ff4b91fd3dd2462986e51a66790ace087238054fa2a599f533390b7296e800fd9fecc3bf1ec3e3a64c5baeeb6a8a1c62737'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
