class Requisition < ApplicationRecord
  belongs_to :user
  has_many :references
end
