class Event < ActiveRecord::Base
 	belongs_to :location
 	attr_accessible :allow_event_scheduling, :allow_track_scheduling, :end_date, :name, :start_date

 	validates :name,					:presence => true
	validates :start_date,				:presence => true
	validates :end_date,				:presence => true
	validates :allow_event_scheduling,	:presence => true
	validates :allow_track_scheduling,	:presence => true
end
