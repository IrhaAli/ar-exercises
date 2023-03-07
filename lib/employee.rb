require 'securerandom'

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, :store, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than: 40, less_than: 200 }

  before_save do
    string_length = 8
    self.password = rand(36**string_length).to_s(36)
  end
end
