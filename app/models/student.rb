class Student < ApplicationRecord
  has_many :tuitions

  after_save :update_cost_count

  def update_cost_count
    self.cost_count = self.tuitions.usable.count
  end
end
