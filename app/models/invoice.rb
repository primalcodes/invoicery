class Invoice < ApplicationRecord
  enum status: { pending: 0, paid: 1 }

  belongs_to :payment_term
  has_many :line_items, dependent: :destroy
  has_one :sender_address, dependent: :destroy
  has_one :client_address, dependent: :destroy

  accepts_nested_attributes_for :sender_address
  accepts_nested_attributes_for :client_address
  accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true

  def total
    line_items.map(&:total).inject(0, &:+).to_f
  end
end
