class Publisher < ActiveRecord::Base
    has_many :books
    validates :first_name, presence: true,
                length: {
                    minimum: 2,
                    maximum: 255
                }

    validates :last_name, presence: true,
                length: {
                    minimum: 2,
                    maximum: 255
                }
end
