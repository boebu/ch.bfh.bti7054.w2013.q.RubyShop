module ShopHelper


  def link_add_to_cart(item)
   link_to_function("", "addToCart(\"#{item}\")", class: 'button foundicon-cart')
  end

  def link_to_clear_cart()
    link_to_function('',"clearCart()", class: 'button foundicon-trash')
  end

end
