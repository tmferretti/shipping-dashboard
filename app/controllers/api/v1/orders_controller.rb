module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = find_orders(params[:vendor_id])
        render 'index.json.jbuilder'
      end

      def show
        @order = find_order(params[:id])
        render 'show.json.jbuilder'
      end

      def create
        order = OrderCreator.create_order(order_params)
      end

      def update
      end

      def destroy
      end

      private

      def order_params
        params.require(:vendor_id, :tracking_number).permit(:order_number)
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
