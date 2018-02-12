class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  belongs_to :current_cart, class_name: "Cart", foreign_key: 'current_cart_id'

  def create_current_cart
    new_cart = carts.create
    self.update(current_cart_id: new_cart.id)
    
  end

  def remove_cart
    current_cart_id = nil
    save
  end

end
