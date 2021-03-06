class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index 
    if params[:tag]
      @pagy, @articles = pagy(Article.tagged_with(params[:tag]), items: 8)
      # @articles = Article.tagged_with(params[:tag]) 原始寫法
    else
      @pagy,  @articles = pagy(Article.all.order('created_at DESC'), items: 8)
      # @articles = Article.all.order('created_at DESC') 原始寫法
    end
  end


  def new
      @article = current_user.articles.build
  end

  def create 
    @article = current_user.articles.build(article_params)
    
    if @article.save 
      redirect_to @article
    else 
      render 'new' #如果沒有存取成功,會渲染一樣的new畫面，這樣頁面的資料不會被洗掉導致需要重新輸入
    end
  end


  def show 
    @article =Article.find(params[:id])
    @articles = Article.all.order('created_at DESC')
  end

  def edit
    @article =Article.find(params[:id]) 
  end 

  def update
    @article =Article.find(params[:id]) 

    if @article.update(params[:article].permit(:title, :body, :tag_list, covers:[]))
      redirect_to @article
    else
      render 'edit'
    end
  end


  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was deleted!"
    redirect_to articles_path
  end


  private 
  def set_article
    @article = Article.find(params[:id])
  end
  
  def authorized_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to articles_path, notice: "Not authorized to edit this article" if @article.nil?
  end

  def article_params
    params.require(:article).permit(:title, :body, :user, :tag_list, covers:[])
  end

end
