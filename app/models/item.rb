class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    array = []
    Item.all.each {|i| array << i if i.inventory > 0}
    array
  end

  def remove(amount)
    new_inventory = self.inventory - amount
    self.update(inventory: new_inventory)
  end


end
