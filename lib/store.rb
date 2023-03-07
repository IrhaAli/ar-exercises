class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: { only_integer: true, greater_than: -1 }
  validate :type_of_apparel

  def type_of_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:apparel, "at least one type must be available")
    end
  end

  before_destroy do
    if Employee.where(store_id: self.id).count >= 1
      self.errors.add(:base, "Can't be destroy because of it has one or more employees")
      throw :abort
    end
  end
end
