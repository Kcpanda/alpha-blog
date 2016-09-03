class ArticlesController < ApplicationController

def new
@article=Article.new

end
def create 
	debugger
	@article=Article.new(article_params)
	@article.user=User.first #this is temporary
	if @article.save
		flash[:success]="Article was succefully created"
		redirect_to article_path(@article)
	else
		render 'new'
	end

end
def show
	@article=Article.find(params[:id])


end
def edit 
	@article=Article.find(params[:id])

	end

	def update
		@article=Article.find(params[:id])
		if @article.update(article_params)
			flash[:success]="Article was succefully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def index

		@articles=Article.all

	end

	def destroy
		@article=Article.find(params[:id])
		@article.destroy
		flash[:danger]="Article was succefully deleted"
		redirect_to articles_path
	end

private
	def article_params
		params.require(:article).permit(:title,:description,:created_at,:updated_at)
	end



end
