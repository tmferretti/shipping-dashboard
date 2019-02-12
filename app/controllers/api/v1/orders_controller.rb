module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = find_orders(params[:vendor_id])

        # frontend expects content-range header for pagination
        set_content_range('orders', (JSON.parse params[:range]), @orders.count)

        render 'index.json.jbuilder'
      end

      def show
        @order = find_order(params[:id])
        render 'show.json.jbuilder'
      end

      def create
        @order = OrderCreator.create_order(order_params)
        # render :action => :show
        render :show
      end

      def update
      end

      def destroy
      end

      private

      def order_params
        params.require(:vendor_id, :tracking_num, :address_id).permit(:order_num, :line_items)
      end

      def find_order(id)
        Order.find(id)
      end

      def find_orders(vendor_id)
        Order.where(vendor_id: vendor_id)
      end
    end
  end
end
