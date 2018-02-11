class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user

  def total
    sum = 0
    line_items.each {|i| sum += i.item.price * i.quantity}
    return sum
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    added = Item.find_by(id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item=self.line_items.build(item_id: item_id)
    end
    return line_item
  end

  def checkout
    self.status = "submitted"
    self.line_items.each do |i|
      i.item.inventory -= i.quantity
      i.item.save
    end
  end

end
