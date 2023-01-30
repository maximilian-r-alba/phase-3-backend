class UsersController < ApplicationController

    get "/users" do 
        users = User.all
        users.to_json
    end

    get "/users/:id" do
        user = User.find(params[:id])
        user.to_json
    end

    post "/users" do
        user = User.create(user_params)
        user.to_json
    end

    def user_params
        {name: params[:name]}
    end
end