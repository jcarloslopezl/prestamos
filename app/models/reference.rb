class Reference < ApplicationRecord
  belongs_to :user
  belongs_to :requisition

  validates :first_name, :presence => { :message => " no puede estar vacío" }
            
end
