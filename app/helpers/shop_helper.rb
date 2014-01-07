module ShopHelper


  def link_add_to_cart(item)
   link_to_function("", "addToCart(\"#{item}\")", class: 'button foundicon-cart')
  end

  def link_to_clear_cart()
    link_to_function('',"clearCart()", {:class => 'button foundicon-trash', :title => (I18n.t "clear_cart")})
  end

  def link_remove_from_cart(item)
    link_to_function("", "removeFromCart(\"#{item}\")", class: 'button foundicon-minus remove-item')
  end

  def link_remove_all_from_cart(item)
      link_to_function("", "removeFromCart(\"#{item}\", true)", class: 'button foundicon-trash remove-item')
  end

end
