class HelloController < ApplicationController
  def index
      #Parser.new.perform
      @ria_all_news = RiaNew.order(date: :desc, time: :desc).page(params[:page])


      respond_to do |format|
        format.html  #index.html.erb
        format.json { render json: @ria_all_news }
      end
    end
  end
