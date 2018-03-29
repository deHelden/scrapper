class HelloController < ApplicationController
  def index
    #Parser.new.perform

    @ria_all_news = RiaNew.all.order(date: :desc, time: :desc).page(params[:page]).per(5)

    respond_to do |format|
      format.html  #index.html.erb
      format.json { render json: @ria_all_news }
    end
  end

  def second_index
    #Parser_self.new.perform
    @news_lines = NewSLine.all.order(date: :desc, time: :desc).page(params[:page]).per(5)

    respond_to do |format|
      format.html  #index.html.erb
      format.json { render json: @ria_all_news }
    end
  end

  def log
    @file = File.readlines("log/cron.log")
  end

  def choise
    @all_news = Article.all.order(date: :desc, time: :desc).page(params[:page]).per(5)
  end
end
