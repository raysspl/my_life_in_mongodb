require 'mongoid'

ENV['MONGOID_ENV'] = 'development'  # tell mongoid which group of settings to load
Mongoid.load!("mongoid.yml")        # load the settings

# MyLife is a class that knows how to create documents that describe my life,
# and how to iterate through and print those document to the console.
class MyLife
  def self.create!

    # Using a hash to create
    tim = {
      first_name: 'tim',
      last_name: 'preston',
      years: [
        year: '2001',
        events: [
          description: 'Graduated!'
        ]
      ]
    }

    Timeline.create!(tim)

    # Using ruby objects to create
    francis = Timeline.new
    francis.first_name = 'francis'

    year = francis.years.new
    year.year = '2013'

    event = year.events.new
    event.description = "Studied at GA"

    francis.save
  end

  def self.print
  end
end

class Timeline
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String

  embeds_many :years
end

class Year
  include Mongoid::Document

  field :year, type: String

  embeds_many :events
  embedded_in :timeline
end

class Event
  include Mongoid::Document

  field :description, type: String

  embedded_in :year
end