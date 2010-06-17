# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bs',
  :secret      => 'a6742b6479d76872b690d833dc0b118b2a38c3d300167ab55420a26d74b2f79d7b488881fb4d607967a3cd61ba0154ef76958ad626b8c09333c07e7d931a678e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
