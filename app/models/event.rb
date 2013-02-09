class Event < ActiveRecord::Base
 	belongs_to :location
 	attr_accessible :allow_event_scheduling, :allow_track_scheduling, :end_date, :name, :start_date, :location_id

 	validates :name,					:presence => true
 	validates_date :start_date, :after => lambda { Date.current }
 	validates_date :end_date, :on_or_after => :start_date
 	validates_inclusion_of :allow_event_scheduling, :in => [true, false]
 	validates_inclusion_of :allow_track_scheduling, :in => [true, false]
	#validates :start_date,				:presence => true
	#validates :end_date,				:presence => true
	#validates :allow_event_scheduling,	:presence => true
	#validates :allow_track_scheduling,	:presence => true
end
