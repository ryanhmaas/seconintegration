class Account < ApplicationRecord
    has_many :users, :dependent => :delete_all
    accepts_nested_attributes_for :users
end
