class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :login_required, except: [:index, :show]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "HELLO",
        :template => "orders/show.pdf.erb"
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    carthash = {}
    cart = cookies["shopping-cart"]
    if cart.nil?
      redirect_to @order, notice: 'No Items in Shopping Cart'
    else
      acart = cart.split(",").group_by(&:to_i).map{ |k,v| {k => v.length} }
      acart.each do |c|
        carthash.merge!(c)
      end
      @carthash = carthash
      @items = Item.where(id: carthash.keys)

    end

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user=current_user
    respond_to do |format|
      if @order.save
        cookies.delete "shopping-cart"
        OrderMailer.mail_order(@order).deliver
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params[:order]
    end
end
