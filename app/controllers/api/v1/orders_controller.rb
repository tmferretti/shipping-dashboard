module Api
  module V1
    class OrdersController < ApplicationController
      expose(:orders) { Order.where(vendor_id: params[:vendor_id]) }
      expose(:order) { Order.find(params[:id]) }

      def index
        render 'index.json.jbuilder'
      end

      def show
        render 'show.json.jbuilder'
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
