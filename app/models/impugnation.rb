# encoding: utf-8

class Impugnation < ActiveRecord::Base

	belongs_to :edital
	belongs_to :user

	attr_accessible :edital_id, :user_id, :arquivo

 	has_attached_file :arquivo, 
 							:path => ":rails_root/non-public/system/impugnations/:id/:basename.:extension",
 							:url => "/:class/:id/:attachment" 

	validates_attachment_presence :arquivo

	validates_attachment_content_type :arquivo, :content_type => ['application/pdf'], :message => 'Somente arquivos pdf.'

	validates_attachment_size :arquivo, :less_than => 50.megabytes

end
