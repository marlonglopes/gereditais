class Cep < ActiveRecord::Base

	attr_accessible :cep, :logradouro, :bairro, :localidade, :uf

	after_save :grava_mumps

	def grava_mumps

		ret=wsghc(:id=>14,:param=>"str")
		
	end



end
