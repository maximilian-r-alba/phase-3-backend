class ReviewsController < ApplicationController

    post '/reviews' do
        review = Review.create(review_params)
        review.to_json
    end

    get '/reviews/book/:id' do
        reviews = Review.all.where(book_id: params[:id])
        reviews.to_json(:include => [:book , :user])
    end

    patch '/reviews/:id' do
        review = Review.find(params[:id])
        review.update(review_params)
        review.to_json
    end

    delete '/reviews/:id' do
        review = Review.find(params[:id])
        review.destroy
        review.to_json
    end

    def review_params
        {title: params[:title], rating: params[:rating], user_id: params[:user_id], book_id: params[:book_id], content: params[:content]}
    end
end