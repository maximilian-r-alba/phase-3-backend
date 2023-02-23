class UsersController < ApplicationController

    get "/users" do 
        users = User.all
        users.to_json
    end

    get "/users/:id" do
        user = User.find(params[:id])
        user.to_json
    end

    get '/users/:id/reviews' do
        reviews = User.find(params[:id]).reviews
        reviews.to_json
    end

   
end