class BooksController < ApplicationController

    get '/books' do
        books = Book.all
        books.to_json
    end

    get '/books/:id' do 
        book = Book.find(params[:id])
        book.to_json
    end

    get '/books/author/alphabetical' do
        sorted = Book.all.sort_by{|book| book.author}
        sorted.to_json
    end
    get '/books/genre/fiction' do
        filtered = Book.all.select{|book| book.fiction?}
        binding.pry
        filtered.to_json
    end
    get '/books/genre/nonfiction' do
        filtered = Book.all.select{|book| !book.fiction?}
        filtered.to_json
    end

    post '/books' do 
        book = Book.create(book_params)
        book.to_json
    end

    def book_params
        {title: params[:title], genre: params[:genre], author: params[:author], rating: params[:rating], cover_url: params[:cover_url]}
    end
  
end
