class Product < ApplicationRecord

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

