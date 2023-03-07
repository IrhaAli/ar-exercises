class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: { only_integer: true, greater_than: 0 }
  validate :type_of_apparel

  def type_of_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:apparel, "at least one type must be available")
    end
  end
end
