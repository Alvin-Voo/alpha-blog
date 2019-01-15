class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # form_builder.submit (in new.html.erb) directs here
    # below line, not rendering template but instead checking the params from article
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      # no validation error
      flash[:notice] = "Article was successfully created"
      # redirect_to article_path(@article) # this redirects to show action

      puts "ALVIN >>> #{article_path(@article)}" # /articles/:id
      puts "ALVIN >>> #{article_params}" # this shows the params {"title"=>"", description => ""}
      redirect_to action: "show", id: @article.id
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    title = @article.title
    @article.destroy
    flash[:notice] = "Article: '#{title}' was successfully deleted"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end