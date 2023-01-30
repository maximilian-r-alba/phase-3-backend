class BooksController < ApplicationController

    get '/books' do
        books = Book.all
        books.to_json
    end

    get '/books/:id' do 
        book = Book.find(params[:id])
        book.to_json
    end

  
end
