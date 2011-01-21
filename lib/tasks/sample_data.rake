# encoding: utf-8

require 'soap/wsdlDriver'

require 'faker'

	namespace :db do
		desc "Fill database with sample data"
			task :populate => :environment do
				Rake::Task['db:reset'].invoke
				make_users
				make_modalidades
#				make_editals
#				make_microposts
#				make_relationships
				import_companies
#				import_ceps
		end
	end


#    t.string   "username"
#    t.string   "email"
#    t.string   "password_hash"
#    t.string   "password_salt"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#    t.boolean  "admin",         :default => false
#    t.string   "cnpj_cpf"
#    t.string   "razao_social"
#    t.string   "fone"
#    t.string   "fax"
#    t.string   "contato"


	def make_modalidades

			Modalidade.create!(
						:codigo=>1,
						:descricao=>"Concorrência"
						)

			Modalidade.create!(
						:codigo=>2,
						:descricao=>"Concorrência Internacional"
						)
	end


	def make_users

		begin

		admin = User.create!(:username => "marlonglopes", 
									:email => "lmarlon@ghc.com",
									:password => "teste",
									:password_confirmation => "teste",
									:cnpj_cpf=>"540.457.970-68",
									:razao_social=>"GHC - Gerencia de Informática",
									:fone=>"33572536",
									:fax=>"",
									:contato=>"")

		admin.toggle!(:admin)

		rescue
		end

#		[10..99].each do |n|
#			username = "#{Faker::Name.first_name}#{n}"
#			email = "exemplo-#{n}@exemplo.com"
#			password = "password"
#			cnpj_cpf = "540.457.970-#{n}"
#			razao_social = "Razao Social"
#			fone = "33287147"
#			fax = "3254354"
#			contato = "contato"

#			User.create!(	:username => username, 
#								:email => email, 
#								:password => password, 
#								:password_confirmation => password,
#								:cnpj_cpf=>cnpj_cpf,
#								:razao_social=>razao_social,
#								:fone=>fone,
#								:fax=>fax,
#								:contato=>contato)


#		end

	end


#   t.integer  "numero_licitacao"
#    t.integer  "ano_licitacao"
#    t.integer  "modalidade_id"
#    t.string   "titulo"
#    t.text     "descricao"
#    t.text     "aviso"
#    t.date     "data_publicacao"
#    t.date     "data_abertura"
#    t.boolean  "publicado"
#    t.boolean  "bionexo"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#    t.string   "edital_file_name"
#    t.string   "edital_content_type"
#    t.integer  "edital_file_size"
#    t.datetime "edital_updated_at"


	def make_editals

		edital = Edital.first

		100.times do |n|
			
#			numero_licitacao = n
#			modalidade_id = "1"
#			titulo = "titulo"
#			descricao = Faker::Lorem.paragraph
#			aviso = Faker::Lorem.paragraph
#			data_publicacao = "08/09/2010"
#			data_abertura = "08/10/2010"
#			publicado=""
#			bionexo=""

			mod=rand(3)
			if mod==0
				mod=1
			end
			datap=edital.publicacao
			dataa=datap+(rand(1000))
			Edital.create!(
						:numero_licitacao=>n,
						:ano_licitacao=>edital.ano_licitacao,
						:modalidade_id=>mod,
						:titulo=>Faker::Lorem.sentence,
						:descricao=>Faker::Lorem.paragraph,
						:aviso=>Faker::Lorem.paragraph,
						:data_publicacao=>datap,
						:data_abertura=>dataa,
						:hora_abertura=>"10:15",
						:publicado=>true,
						:edital=>edital.edital
						)
		puts n
		end


	end


	def get_date(date)
#		puts "date: #{date}"
		data=Date.strptime(date, "%d/%m/%Y")+rand(30)
#		puts "data: #{data}"
		data.to_s
	end


	def make_microposts
#		User.all(:limit => 6).each do |user|
#				50.times do
#					content = Faker::Lorem.sentence(5)
#				end
#					user.microposts.create!(:content => content)
#		end
	end

	def make_relationships
#		users = User.all
#		user = users.first
#		following = users[1..50]
#		followers = users[3..40]
#		following.each { |followed| user.follow!(followed) }
#		followers.each { |follower| follower.follow!(user) }
	end


######################


	def import_companies

		ch="0"
		gl=""
		
		begin
			
			begin
				ret=wsghc(:id=>11,:param=>ch).split("#")
			rescue
				break
			end

			cnpj_cpf=ret[0].gsub(/\D/, "")
			cnpj_cpf="#{cnpj_cpf[0,2]}.#{cnpj_cpf[2,3]}.#{cnpj_cpf[5,3]}/#{cnpj_cpf[8,4]}-#{cnpj_cpf[12,2]}"
			# 11.444.777/0001-XX.

			email=ret[2]
			#puts email

			gl=ret[1].split("^")
			pass=gl[2]
			rz=gl[0]
			us=rz.gsub(" ","")[0..5]
			puts "#{us}, #{rz}, #{cnpj_cpf}, #{pass}, #{email}"
	

				begin
				user=User.new(:username => us,
											:email => email,
											:password => pass,
											:password_confirmation => pass,
											:cnpj_cpf=>cnpj_cpf,
											:razao_social=>rz)
				user.save!
				rescue
				
				end

			ch=ret[0]

		end until ch.empty?

	end

	def import_ceps

#		ch="0"
		ch='^|"DAT,GHC"|TABCEP(83707210)'
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

      SOAP::WSDLDriverFactory.new(wsdlr).create_rpc_driver

    end




