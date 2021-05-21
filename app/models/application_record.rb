class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates :name, presence: true
  validates :email, presence: true
end
