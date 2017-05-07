class Book < ActiveRecord::Base
    belongs_to :author
    belongs_to :category
    belongs_to :publisher

    validates :title, presence: true,
                length: {
                    minimum: 2,
                    maximum: 255
                }

    validates :category_id, presence: true
    validates :author_id, presence: true
    validates :publisher_id, presence: true
    validates :isbn, presence: true
    validates :year, presence: true, numericality: true
    validates :price, presence: true, numericality: true
    validates :buy, presence: true, length: {minimum: 7}
    validates :format, presence: true,
                length: {
                    minimum: 3,
                    maximum: 255
                }
    validates :pages, presence: true, numericality: true
end
