class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    array = []
    Item.all.each {|i| array << i if i.inventory > 0}
    array
  end
end
