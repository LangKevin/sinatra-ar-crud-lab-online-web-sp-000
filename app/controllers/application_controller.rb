
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    binding.pry
    erb :index
  end

  get '/articles' do
    @articles = Article.all
binding.pry
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find[params[:id]]
    erb :show
  end
  post '/articles' do
    @article = Article.create(params)
    # binding.pry
    redirect to "articles/#{@article.id}"
  end
end
