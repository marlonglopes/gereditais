class EditalSweeper < ActionController::Caching::Sweeper

	observe Edital

	def after_save(edital)
		clear_editals_cache(edital)
		
#		logger.info( "Salvando registro em #{edital}!" )

	end

	def after_destroy(edital)
		clear_editals_cache(edital)
		
#		logger.info( "Deletando registro em #{edital}!" )		

	end
	
	def clear_editals_cache(edital)
		expire_page :controller=> 	:editals, 
											:action=>:index		
		expire_page :controller=> 	:editals, 
											:action=>:show, 
											:id=>edital
	end
	
end
