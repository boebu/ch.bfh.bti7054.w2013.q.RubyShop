class ShopController < ApplicationController
  def index
    session[:language_id] = Language.first.id
    @languages = Language.all
    @topcategories = Category.all.where(parent_id: nil)
    @items = Item.all

  end

end
