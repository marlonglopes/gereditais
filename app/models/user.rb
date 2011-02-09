# encoding: utf-8

class User < ActiveRecord::Base

	before_save :prepare_password, :valida_cnpj_cpf
	after_save :grava_mumps

	has_many :download , :dependent => :destroy
	has_many :edital , :through=> :download 
	has_many :upload , :dependent => :destroy
	has_many :impugnation , :dependent => :destroy
	has_many :micropost , :dependent => :destroy

	# new columns need to be added here to be writable through mass assignment
	attr_accessible :username, :email, :password, :password_confirmation, :cnpj_cpf,	
							:razao_social,:fone, :fax, :contato, 
							:cep, :logradouro, :numero, :complemento, :bairro, :cidade, 
							:uf, :inscr_estatual,:admin

	attr_accessor :password

	validates_presence_of :cnpj_cpf, :razao_social

	validates_presence_of :username
	validates_uniqueness_of :username, :cnpj_cpf , :allow_blank => false

	CPF  = /\d{3}\.\d{3}\.\d{3}\-\d{2}/
	CNPJ = /\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}/

	validates_format_of :cnpj_cpf, :with =>/^(#{CPF})|(#{CNPJ})$/, :allow_blank => false, :message => "CPF ou CNPJ formato inválido", :uniqueness =>{:case_sensitive => false}

	validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => false, :message => "Apenas letras, numeros, ou .-_@"

#	EMAIL= /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/x
	EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates_format_of :email, :with =>/^(#{EMAIL})$/ , :allow_blank => true
	
	validates_presence_of :password, :on => :create
	validates_confirmation_of :password, :on=> :create
	validates_length_of :password, :minimum => 4, :allow_blank => false , :on=>:create

  # login can be either username or cnpj_cpf
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_cnpj_cpf(login)
    return user if user && user.matching_password?(pass)
  end

  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end

	def group_by_editals
		begin
			download.group("edital_id").select("edital_id, count(edital_id) as edital_count")
		rescue
			[]
		end
	end


# exporta cadastro para base mumps
	def grava_mumps

	str="#{self.username}^#{self.email}^#{self.cnpj_cpf}^#{self.razao_social}^#{self.fone}^#{self.fax}^#{self.contato}^#{self.cep}^#{self.logradouro}^#{self.numero}^#{self.complemento}^#{self.bairro}^#{self.cidade}^#{self.uf}^#{self.inscr_estatual}"
		
		logger.info(str)		
		
		ret=ControllerConsomewsghc::wsghc(:id=>14,:param=>str)
		
	end



private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end
  
  def valida_cnpj_cpf
  	
  	if self.cnpj_cpf.to_s.gsub(/[.-]/,'').length==11

		cpf=self.cnpj_cpf.to_s

		val=cpf.gsub(/[.-]/,'')

		_9=val[0..8]
		_dv=val[9..11]

		_9v=_9.split(//)
		_9n=[]
		10.downto(2) { |n| _9n << n.to_s }

		_tot=[]
		_9n.each_index { |n| _tot << _9n[n].to_i * _9v[n].to_i }

		tot=0
		_tot.each { |n| tot=tot+n }

		div=tot/11
		mod=tot%11

		if mod<2
			_dv1=0
		else
			_dv1=11-mod
		end

		_9v << _dv1

		_9n=[]
		11.downto(2) { |n| _9n << n.to_s }

		_tot=[]
		_9n.each_index { |n| _tot << _9n[n].to_i * _9v[n].to_i }

		tot=0
		_tot.each { |n| tot=tot+n }

		div=tot/11
		mod=tot%11

		if mod<2
			_dv2=0
		else
			_dv2=11-mod
		end

		_dvc="#{_dv1}#{_dv2}"
	
		if _dvc != _dv then
			errors.add(:cnpj_cpf,"'CPF #{self.cnpj_cpf}', digito verificador inválido")
			return false
		end

  	elsif self.cnpj_cpf.to_s.gsub(/[.-]/,'').gsub(/[\/]/,'').length==14

		cnpj=self.cnpj_cpf.to_s
		val=cnpj.gsub(/[.-]/,'').gsub(/[\/]/,'')

		_12=val[0..11]
		_dv=val[12..14]

		_12v=_12.split(//)
		_12n=[]
		[5,4,3,2,9,8,7,6,5,4,3,2].each { |n| _12n << n.to_s }

		_tot=[]
		_12n.each_index { |n| _tot << _12n[n].to_i * _12v[n].to_i }

		tot=0
		_tot.each { |n| tot=tot+n }

		div=tot/11
		mod=tot%11

		if mod<2
			_dv1=0
		else
			_dv1=11-mod
		end

		_12v << _dv1

		_12n=[]
		[6,5,4,3,2,9,8,7,6,5,4,3,2].each { |n| _12n << n.to_s }

		_tot=[]
		_12n.each_index { |n| _tot << _12n[n].to_i * _12v[n].to_i }

		tot=0
		_tot.each { |n| tot=tot+n }

		div=tot/11
		mod=tot%11

		if mod<2
			_dv2=0
		else
			_dv2=11-mod
		end

		_dvc="#{_dv1}#{_dv2}"
	
		if _dvc != _dv then
			errors.add(:cnpj_cpf,"'CNPJ #{self.cnpj_cpf}', digito verificador inválido")
			return false
		end


	else
		errors.add(:cnpj_cpf,"'CNPJ ou CPF Inválido, tamanho para CPF 11 dígitos, tamanho para CNPJ 14 dígitos'")
		return false
  	end

  end
  
end
