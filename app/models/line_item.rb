class LineItem < ApplicationRecord
  belongs_to :invoice

  def total
    (quantity * price).to_f
  end
end
