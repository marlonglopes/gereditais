# encoding: utf-8

class Modalidade < ActiveRecord::Base

	has_many :edital , :dependent => :destroy

	attr_accessible :codigo, :descricao

	validates_presence_of :codigo,:descricao

	validates_numericality_of :codigo


end
