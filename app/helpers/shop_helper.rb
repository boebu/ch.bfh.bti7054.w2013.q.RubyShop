module ShopHelper


  def link_add_to_cart(name,item)
   link_to_function(name, "addToCart(\"#{item}\")", class: 'button')
  end
end
