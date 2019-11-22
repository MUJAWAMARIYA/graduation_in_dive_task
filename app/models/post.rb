class Post < ApplicationRecord
    belongs_to :user
    paginates_per 1
end
