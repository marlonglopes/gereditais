# encoding: utf-8

require 'soap/wsdlDriver'

require 'faker'

	namespace :db do
		desc "Fill database with ceps data"
			task :importa_ceps => :environment do
				import_ceps_txt
#				import_ceps_ws
#
		end
	end


	def import_ceps_txt

	  File.open("#{Rails.root}/tabcep.txt", "r").each {|f|

		  	c=f.to_s.split("^")
			puts "#{c}"

		  	cep=c[0]
	  		localidade=c[1]
  			uf=c[2]
  			logradouro=c[5]
  			bairro=c[7]

			begin
				cep=Cep.new(:cep => cep,
								:logradouro => logradouro,
								:bairro => bairro,
								:localidade => localidade,
								:uf=>uf)
				cep.save!
			rescue
			end


		}

#		cont=0
#		
#		begin
#			

#			cep=ret[1]
#			gl=ret[2].split("^")

#			cidade=gl[0]
#			uf=gl[1]
#			logradouro=gl[4]
#			bairro=gl[6]

#			puts "#{cont},  #{cep}, #{cidade}, #{uf}, #{logradouro}, #{bairro}, "

#			begin

#				cep=Cep.new(:cep => cep,
#								:logradouro => logradouro,
#								:bairro => bairro,
#								:localidade => cidade,
#								:uf=>uf)
#				cep.save!

#			rescue

#			end
#			cont=cont+1

#			ch=ret[0]

#		end until ch.empty?

	end



	def import_ceps_ws

		ch="0"
#		ch='^|"DAT,GHC"|TABCEP(83707210)'
		puts "#{ch}"
		gl=""

		cont=0
		
		begin
			
			begin
				ret=wsghc(:id=>13,:param=>ch).split("#")
			rescue
				break
			end

			cep=ret[1]
			gl=ret[2].split("^")

			cidade=gl[0]
			uf=gl[1]
			logradouro=gl[4]
			bairro=gl[6]

			puts "#{cont},  #{cep}, #{cidade}, #{uf}, #{logradouro}, #{bairro}, "

			begin

				cep=Cep.new(:cep => cep,
								:logradouro => logradouro,
								:bairro => bairro,
								:localidade => cidade,
								:uf=>uf)
				cep.save!

			rescue

			end
			cont=cont+1

			ch=ret[0]

		end until ch.empty?

	end

	def wsghc(params={})

		
		id = params[:id] ?  params[:id] : 10
		param= params[:param] ?  params[:param] : "param^param"
		 
		soap = wsdl
		response = soap.GHCGenericFunction(:id => id, :param => param)
		soap.reset_stream
		response.gHCGenericFunctionResult
	end


 private
    def wsdl

		wsdlr = "http://workflow.ghc.com.br/wsghcworkflow/WSGHCWorkflow.asmx?WSDL"
		wsdll = "http://130.158.1.41/WSGHCWorkflow/WSGHCWorkflow.asmx?WSDL"

      SOAP::WSDLDriverFactory.new(wsdll).create_rpc_driver

    end




