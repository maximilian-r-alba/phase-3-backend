class BooksController < ApplicationController

    get '/books' do
        books = Book.all
        books.to_json
    end

    get '/books/:id/reviews' do
        reviews = Book.find(params[:id]).reviews
        reviews.to_json
    end

end
