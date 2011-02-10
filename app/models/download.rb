# encoding: utf-8

class Download < ActiveRecord::Base

	belongs_to :edital
	belongs_to :user
	
	attr_accessible :edital_id, :user_id
	
end

