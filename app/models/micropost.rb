# encoding: utf-8

class Micropost < ActiveRecord::Base

	belongs_to :edital
	belongs_to :user

	default_scope :order => 'microposts.created_at DESC'
	
	validates_presence_of :post, :message => 'Não é possível postar mensagem em branco'

end
