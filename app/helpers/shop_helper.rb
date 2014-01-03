module ShopHelper


  def link_add_to_cart(item)
   link_to_function("", "addToCart(\"#{item}\")", class: 'button foundicon-cart')
  end

end
