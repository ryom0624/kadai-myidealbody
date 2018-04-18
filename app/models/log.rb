class Log < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :date, presence: true, uniqueness: { scope: [:user_id] }
  validates :weight, :fat, numericality: { greater_than: 0 }
end
