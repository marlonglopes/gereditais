# encoding: utf-8

class Edital < ActiveRecord::Base

	belongs_to :modalidade
	has_many :upload , :dependent => :destroy
	has_many :impugnation , :dependent => :destroy
	has_many :download , :dependent => :destroy
	has_many :user , :through=> :download
	has_many :micropost , :dependent => :destroy

	scope :nabertos ,  where("data_abertura >= ?", Date.today)
	scope :publicados , nabertos.where(:publicado => true)

	scope :find_by_licitacao, lambda {|licitacao| {
						:conditions => {:numero_licitacao => licitacao.split('/').first, 
     					:ano_licitacao => licitacao.split('/').last}}}

 	search_methods :find_by_licitacao

	attr_accessible :numero_licitacao, :ano_licitacao, :modalidade_id, :titulo, :descricao,
	 :aviso, :data_publicacao, :data_abertura, :publicado, :edital, :hora_abertura


	validates_presence_of :numero_licitacao, :ano_licitacao, :modalidade_id, 
								:titulo, :descricao, :data_publicacao, :data_abertura, :edital, :hora_abertura

	validate :valida_datas
	validate :valida_hora_abertura

	HORA  = /\d{2}\:\d{2}/
	validates_format_of :hora_abertura, :with =>/^(#{HORA})$/, :allow_blank => false, :message => "hora abertura formato inválido"

	###################################################################################
	#attachment_virtual_path = "/system/attachments/:id/:basename.:extension"
	#attachment_real_path = ":rails_root/public" + attachment_virtual_path
 	#has_attached_file :edital, :path => attachment_real_path, :url => attachment_virtual_path
# 	has_attached_file :edital, :url => "/assets/editals/:id/:basename.:extension", :path => ":rails_root/public/assets/editals/:id/:style/:basename.:extension" 

 	has_attached_file :edital, 
 							:url => "/system/editals/:id/:basename.:extension", 
 							:path => ":rails_root/public/system/editals/:id/:basename.:extension" 

	validates_numericality_of :numero_licitacao, :ano_licitacao , :modalidade_id

	validates_attachment_presence :edital
	validates_attachment_content_type :edital, :content_type => ['application/pdf','application/zip'],
												:message => 'Somente pdf. e zip.'
	validates_attachment_size :edital, :less_than => 200.megabytes

	#####################################################################################

	def licitacao
	  [self.numero_licitacao, self.ano_licitacao].join('/')
	end

	def publicacao
		self[:data_publicacao].to_date
	end

	def abertura
		self[:data_abertura].to_time
	end

	def valida_hora_abertura
		if self.hora_abertura == "00:00"
			errors.add(:hora_abertura,"'Valor inválido para hora de abertura'")
			return false
		end
	end

	def valida_datas
		begin
			if self[:data_abertura] < self[:data_publicacao]
				errors.add(:data_abertura,"precisa ser maior que data de publicação")
				return false
			end
		rescue
		end
	end

	def data_abertura=(data)
		begin
			date=data.split("/")
			self[:data_abertura]=Date.new(date[2].to_i,date[1].to_i,date[0].to_i)
		rescue
			self[:data_abertura]=data
		end
	end

	def data_abertura
		begin
			self[:data_abertura].to_time.strftime('%d/%m/%Y')
		rescue
			self[:data_abertura]
		end
	end

	def hora_abertura
		begin
			self[:data_abertura].to_time.strftime('%H:%M')
		rescue
			""
		end
	end

	def hora_abertura=(hora)
#		data=data_abertura
##		date=Time.parse("#{data} #{hora}")
###		date=Time.zone.now
##		self[:hora_abertura]=hora
##		self[:data_abertura]=date
#		data_abertura="#{data} #{hora}"
		data=self[:data_abertura].to_date
		self[:data_abertura]=Time.parse("#{data} #{hora}")
#		logger.info("=================Hora: #{hora}, Data: #{data}=================")
		return true
	end


	def data_publicacao=(data)
		begin
			date=data.split("/")
			self[:data_publicacao]=Date.new(date[2].to_i,date[1].to_i,date[0].to_i)
		rescue
			self[:data_publicacao]=data
		end
	end

	def data_publicacao
		begin
			self[:data_publicacao].strftime('%d/%m/%Y')
		rescue
			self[:data_publicacao]
		end
	end

end
