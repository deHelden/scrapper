class HelloController < ApplicationController
  def index
      #Parser.new.perform
      require 'open-uri'
      @ria_all_news = RiaNew.order(date: :desc, time: :desc).page(params[:page]).per(5)

      respond_to do |format|
        format.html  #index.html.erb
        format.json { render json: @ria_all_news }
      end
    end
  end
