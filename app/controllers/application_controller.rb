require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      puts params
      @team=Team.new(params[:team])
      puts @team.name
      params[:team][:members].each do |details|
        Member.new(details)
      end
      @members=Member.all
      puts @members

      erb :super_hero
    end


end
