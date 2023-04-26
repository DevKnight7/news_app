require 'news-api'
require 'rest-client'

class ArticlesController < ApplicationController

  def index
    response ||= RestClient.get "https://newsapi.org/v2/top-headlines?country=us&apiKey=8ba0c712d6e441adb114d84cbae425d6"

    @articles = JSON.parse(response.body)["articles"]
  end

  def show
    response = RestClient.get "https://newsapi.org/v2/everything?q=#{params[:title]}&apiKey=8ba0c712d6e441adb114d84cbae425d6"
    @article = JSON.parse(response.body)["articles"].first
    render :show, locals: { article: @article }
  end

  def search
    if params[:q].present?
      response = RestClient.get "https://newsapi.org/v2/everything?q=#{params[:q]}&apiKey=8ba0c712d6e441adb114d84cbae425d6"
      @articles = JSON.parse(response.body)["articles"]
    else
      @articles = []
    end    
  end
end
