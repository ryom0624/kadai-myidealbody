class Goal < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :date, presence: true, uniqueness: { scope: [:user_id] }
  validates :weight, numericality: { greater_than: 0, less_than: 200.00 }
  validates :fat, numericality: { greater_than: 0, less_than: 100.0 }
end
