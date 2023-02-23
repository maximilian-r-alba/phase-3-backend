class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :book
    after_save :calculate_rating
    after_destroy :calculate_rating
    has_many :comments

    private
        def calculate_rating

            book = self.book

            reviews_sum = book.reviews.map{|review| review.rating}.sum.to_f

            total_reviews = book.reviews.count
            
            average_rating = (reviews_sum/total_reviews).round(2)
            
            book.update(rating:average_rating)
        end


end