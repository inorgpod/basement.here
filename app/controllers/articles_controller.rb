class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index 
    @articles = Article.all.order('created_at DESC')
  end


  def new
    # @article = current_user.articles.build
  end

  def create 
    @article = Article.new(article_params)
    @article.save 

    redirect_to @article
  end


  def show 
    @article =Article.find(params[:id])
  end

  private 
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :user)
  end

end
