class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :login_required, except: [:cartlist, :shoplist]

  # GET /items
  # GET /items.json
  def index
      @items = Item.all
  end

  def shoplist
    @items = Item.includes(:categories).where(categories: {id: params[:categories]})
    respond_to do |format|
      format.html {render layout: false}
    end
  end

  def cartlist
    if params[:itemids]
      carthash = {}
      acart = params[:itemids].group_by(&:to_i).map { |k, v| {k => v.length} }
      acart.each do |c|
        carthash.merge!(c)
      end
      @carthash = carthash
      @items = Item.where(id: @carthash.keys)
    end
    respond_to do |format|
      format.html { render layout: false }
    end
  end


  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @language = Language.all
    @category = Category.all
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @language = Language.all
    @category = Category.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params[:item].permit(:price, :imgSrc, :category_ids => [],translations_attributes: [:id, :title, :description, :language_id, :_destroy])
    end

end
