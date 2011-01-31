# encoding: utf-8 

module EditalsHelper

	def download_url(edital)
		edital_edital_path(edital)
	end

	def link(content,edital)
		if logged_in? 
			if current_user.admin?
				link_to content , edital
			else
				link_to content , new_edital_download_path(edital)
			end
		else
			content
		end
	end

	def wrap(content)
		raw(content.split.map{ |s| wrap_long_string(s) }.join(' '))
	end

	def get_data(date)
		if date
			begin
				data=date
				var=data.to_s.split(" ")
				data=var[0].split("-")
				"#{data[2]}/#{data[1]}/#{data[0]}"	
			rescue
				""
			end
		end
	end
private

	def wrap_long_string(text, max_width = 30)
		zero_width_space = "&#8203;"
		regex = /.{1,#{max_width}}/
		(text.length < max_width) ? text : text.scan(regex).join(zero_width_space)
	end



end
