class LineItem < ActiveRecord::Base
  belongs_to :item, :cart
end
