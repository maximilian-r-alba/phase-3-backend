class BooksController < ApplicationController

    get '/books' do
        books = Book.all
        books.to_json
    end

    get '/books/:id' do 
        book = Book.find(params[:id])
        book.to_json
    end

    post '/books' do 
        book = Book.create(book_params)
        book.to_json
    end

    def book_params
        {title: params[:title], genre: params[:genre], author: params[:author], rating: params[:rating], cover_url: params[:cover_url]}
    end
  
end
