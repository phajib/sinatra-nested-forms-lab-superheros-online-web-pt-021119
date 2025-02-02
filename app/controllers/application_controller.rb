require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
      end

    post '/team' do
        @team = Team.new(params[:team])

        params[:team][:hero].each do |member_info|
            Hero.new(member_info)
        end

        @heroes = Hero.all
        erb :team
    end
end
