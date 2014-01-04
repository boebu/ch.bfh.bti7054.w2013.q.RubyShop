class ShopController < ApplicationController
  def index
    if(session[:language_id].nil?)
      session[:language_id] = Language.first.id
    end
    @languages = Language.all
    @topcategories = Category.all.where(parent_id: nil)
    @items = Item.all
  end

  def set_lang
    session[:language_id] = Language.where(language: params[:lang]).first.id
    render nothing: true
  end

end
