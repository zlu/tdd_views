module ApplicationHelper
	def show_content_for(role)
		yield if current_user.has_role?(role)
	end
end
