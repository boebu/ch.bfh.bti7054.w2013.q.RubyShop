class ShopController < ApplicationController
  def index
    #session[:language_id] = Language.first.id
    @languages = Language.all
    @topcategories = Category.all.where(parent_id: nil)
    @items = Item.all
  end

  def set_lang
    session[:language_id] = Language.where(language: params[:lang]).first.id
    render nothing: true
  end

end
