require 'pry'
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

    # get '/books/author/:sort_method' do
    #       case params[:sort_method]
                    # when 'alphabetical'
                    # sorted = Book.all.sort_by{|book| book.author}
                    # sorted.to_json
            # end

    # end

    get '/books/genre/fiction' do
        fictionBooks = Book.all.select{|book| book.fiction?}
        fictionBooks.to_json
    end

    # get '/books/genre/fiction/:genre' do
    #     ficitonBooks = Book.all.select{|book| book.fiction?}
    #     filteredFiciton = fictionBooks.select{|book| book.genre == params[:genre]}
    # end

    get '/books/genre/nonfiction' do
        nonfictionBooks = Book.all.select{|book| !book.fiction?}
        nonfictionBooks.to_json
    end

    post '/books' do 
        book = Book.create(book_params(params))
        book.to_json
    end

    def book_params(params)
        {title: params[:title], subgenre: params[:genre], author: params[:author], summary: params[:summary], cover_url: params[:cover_url], fiction?: params[:fiction?]}
    end

  
end
