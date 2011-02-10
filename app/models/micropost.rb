# encoding: utf-8

class Micropost < ActiveRecord::Base

	belongs_to :edital
	belongs_to :user

	default_scope :order => 'microposts.created_at DESC'
	
	validates_presence_of :post, :message => 'Não é possível postar mensagem em branco'

	validates_length_of :post, :maximum => 1000, :message => 'Não é possível postar mensagem com mais de 1000 caracteres'

	attr_accessible :edital_id,:user_id,:post

end
