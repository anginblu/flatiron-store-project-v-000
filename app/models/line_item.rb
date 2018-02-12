class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  def total_price
    item.price.to_f/100 * quantity
  end

end
