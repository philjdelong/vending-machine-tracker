class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snacks

  def avg_snack_price
    x = 0
    snacks.each do |snack|
      x += snack.price
    end
    x / (snacks.length).to_f
  end
end
