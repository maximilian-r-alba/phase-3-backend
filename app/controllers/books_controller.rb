require 'pry'
class BooksController < ApplicationController

    get '/books' do
        books = Book.all.sort_by{|book| book.title}
        books.to_json
    end

    get '/books/toprated' do 
        top_ten = Book.all.select{|book| book.rating}.sort_by{|book| book.rating}.reverse.first(10)
        top_ten.to_json
    end

    get '/books/:id' do 
        book = Book.find(params[:id])
        book.to_json
    end

    get '/books/:id/reviews' do
        reviews = Book.find(params[:id]).reviews
        reviews.to_json
    end

    get '/books/author/alphabetical' do
        sorted = Book.all.sort_by{|book| book.author}
        sorted.to_json
    end

    get '/books/genre/fiction' do
        fictionBooks = Book.all.sort_by{|book| book.title}.select{|book| book.fiction?}
        fictionBooks.to_json
    end

    get '/books/genre/nonfiction' do
        nonfictionBooks = Book.all.sort_by{|book| book.title}.select{|book| !book.fiction?}
        nonfictionBooks.to_json
    end

    post '/books' do 
        book = Book.create(book_params(params))
        book.to_json
    end

    def book_params(params)
        {title: params[:title], subgenre: params[:subgenre], author: params[:author], summary: params[:summary], cover_url: params[:cover_url], fiction?: params[:fiction?]}
    end

  
end
