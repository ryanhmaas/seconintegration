class Category < ApplicationRecord
    has_many :pages, :dependent => :delete_all
    accepts_nested_attributes_for :pages
end
