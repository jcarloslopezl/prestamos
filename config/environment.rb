# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Facebook APP
ENV['FACEBOOK_KEY'] = "158930057905379"
ENV['FACEBOOK_SECRET'] = "f0ed04e953396dc9227dbdf2de78bb09"

# Facebook App Local
# ENV['FACEBOOK_KEY'] = "383314592004122"
# ENV['FACEBOOK_SECRET'] = "0b583d83115bec68edd901b80c97daa0"