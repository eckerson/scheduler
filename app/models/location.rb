class Location < ActiveRecord::Base
 	attr_accessible :address1, :address2, :address3, :address4, :address5, :name

	validates :address1,	:presence => true
	validates :address3,	:presence => true
	validates :address4,	:presence => true
	validates :address5,	:presence => true
	validates :name,		:presence => true
end
