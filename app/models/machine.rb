class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def avg_snack_price
    total_snack_price / snack_count
  end

  def total_snack_price
    x = 0
    snacks.each do |snack|
      x += snack.price
    end
    x
  end

  def snack_count
    (snacks.length).to_f
  end
end
