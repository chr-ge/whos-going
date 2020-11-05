# frozen_string_literal: true

module EventHelper
  def date_in_words(event)
    "starts in #{distance_of_time_in_words Time.now, event.date}"
  end
end
