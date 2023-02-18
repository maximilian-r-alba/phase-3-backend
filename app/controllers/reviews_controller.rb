class ReviewsController < ApplicationController

    get '/books/:id/reviews' do
        reviews = Book.find(params[:id]).reviews
        reviews.to_json
    end

    get '/users/:id/reviews' do
        reviews = User.find(params[:id]).reviews
        reviews.to_json
    end

    get '/reviews/:id/book' do
        book = Review.find(params[:id]).book
        book.to_json
    end

    post '/reviews' do
        review = Review.create(review_params)
        review.to_json
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