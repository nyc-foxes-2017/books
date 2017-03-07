class Book < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :author, presence: :true

  # validate :my_custome_validation
  #
  # def my_custome_validation
  #   if title.length == 0
  #     errors.add(:title, "can not be blank")
  #   end
  # end
end
