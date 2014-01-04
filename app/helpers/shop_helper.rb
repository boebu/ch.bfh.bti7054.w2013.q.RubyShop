module ShopHelper


  def link_add_to_cart(item)
   link_to_function("", "addToCart(\"#{item}\")", class: 'button foundicon-cart')
  end

  def link_to_clear_cart(name)
    link_to_function(name,"clearCart()", class: 'button')
  end

end
