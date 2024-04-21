# frozen_string_literal: true  

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
  def show; end
  
  # GET /orders/new
  def new
    @order = Order.new

    Product.all.each do |product|
      @order.order_items.build(product_id: product.id)
    end
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        calculate_total(@order) # Вызываем метод для вычисления общей суммы

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
        calculate_total(@order) # Вызываем метод для вычисления общей суммы
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
  def set_order
    @order = Order.find(params[:id])
  end

  # Метод для вычисления и обновления общей суммы заказа
  def calculate_total(order)
    total = order.order_items.sum(:price)
    order.update(total: total)
  end

  def order_params
    params.require(:order).permit(:user_id, :payment_history_id, :order_date, :order_address, :total,
                                  order_items_attributes: [:id, :quantity, :product_id, :price])
  end
end
