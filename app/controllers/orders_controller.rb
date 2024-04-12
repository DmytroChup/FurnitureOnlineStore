class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    if params[:user_id]
      @orders = Order.where(user_id: params[:user_id])
    else
      @orders = Order.all
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
    # @orders = Order.find(params[:id])
  end

  # GET /orders/new
  # def new
  #   @order = Order.new
  #   @order.order_items.build # Add this line to build order items
  # end

  def new
    @order = Order.new
    @order.order_items.build

    # Product.all.each do |product|
    #   @order.order_items.build(product_id: product.id)
    # end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    items_to_add(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.order_items.destroy_all  # Удаляем все связанные элементы заказа
    @order.destroy  # Затем удаляем сам заказ

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id, :payment_history_id, :order_date, :order_address, product_ids: [])
  end

  # def order_params
  #   params.require(:order).permit(
  #     :user_id,
  #     :payment_history_id,
  #     :order_date,
  #     :order_address,
  #     product_ids: [],
  #     order_items_attributes: [:id, :product_id, :quantity]
  #   )
  # end

  # def items_to_add(order_params)
  #   @order.order_items.destroy_all
  #
  #   order_items_attributes = order_params[:order_items_attributes]
  #
  #   if order_items_attributes.present?
  #     order_items_attributes.each do |_, item|
  #       quantity = item[:quantity]
  #       product_id = item[:product_id]
  #       @order.order_items.build(product_id: product_id, quantity: quantity)
  #     end
  #   end
  # end

  def items_to_add(order_params)
    @order.products.clear  # Очищаем все продукты из заказа

    order_params[:product_ids].reject(&:empty?).each do |product_id|
      @order.products << Product.find_by(id: product_id)
    end
  end

end
