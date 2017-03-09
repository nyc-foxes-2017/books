class Library < ActiveRecord::Base
  # Remember to create a migration!
  has_many :books
  belongs_to :user
end
