class Cart < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    sum = 0
    items.each {|i| sum = sum + i.price}
    sum
  end

  def add_item(item_id)
    added = Item.find_by(id: item_id)
    if items.include?(added)
      current_line_item = line_items.find_by(item_id: item_id)
      current_line_item.quantity += 1
      current_line_item
    else
      line_items.build(item_id: item_id)
    end
  end

end
