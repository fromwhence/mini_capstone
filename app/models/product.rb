class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }
  validates :description, presence: true
  validates :image_url, presence: true

  def is_discounted?
    price < 200 # if and result implied
    #price < 200 ? true : false # ternary if statement
    # if price < 150
    #   true
    # else
    #   false
    # end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end

