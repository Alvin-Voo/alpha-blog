class ArticlesController < ApplicationController

  def new
    @article = Article.new
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
  
  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end