class Author < ActiveRecord::Base
  #all authors have a name
  validates :name, presence: true
  #no two authors have the same name
  validates :name, uniqueness: { case_sensitive: false }
  #author phone numbers are exactly ten digits
  validates :phone_number, length: { is: 10}
end
