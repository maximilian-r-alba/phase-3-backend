class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :book
    after_create :calculate_rating

    private
        def calculate_rating
            book = self.book

            reviews_sum = book.reviews.map{|review| review.rating}.sum.to_f + self.rating

            total_reviews = book.reviews.count + 1
            
            average_rating = (reviews_sum/total_reviews).round(2)
            book.update(rating:average_rating)
        end
end