class ShopController < ApplicationController
  def index
    session[:language_id] = Language.first.id
    @languages = Language.all
    @topcategories = Category.all.where(parent_id: nil)
    @items = Item.all

    a = [1,1,2,3,4,4,4,6]
    a.sort
    a.group_by(&:inspect).map { |k,v| [k, v.length]}


  end

end
