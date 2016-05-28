class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])		
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "文章建立成功"

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "文章刪除成功"

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "文章編輯成功"

		redirect_to article_path(@article)
	end
end