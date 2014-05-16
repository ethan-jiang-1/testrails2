class ArticlesController < InheritedResources::Base
	skip_filter :mp_set_current_user

	def index
		if params[:tag] != nil 
			@articles = Article.tagged_with(params[:tag])
		else
			@articles = Article.all
		end
	end 
end
