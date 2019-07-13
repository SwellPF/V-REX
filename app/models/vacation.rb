class Vacation < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :location_name, :description, :reason, :best_time, :photo_link
end
