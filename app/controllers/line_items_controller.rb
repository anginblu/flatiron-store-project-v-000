class LineItemsController < ApplicationController
  belongs_to :item, :cart
end
