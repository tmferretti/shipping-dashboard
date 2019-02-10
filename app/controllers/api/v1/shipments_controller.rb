module API
  module V1
    class ShipmentsController < ApplicationController
      expose(:shipments) { Shipment.where(vendor_id: params[:vendor_id]) } if params[:vendor_id]
      expose(:shipments) { Shipment.where(order_id: params[:order_id]) } if params[:order_id]
      expose(:shipment) { Shipment.where(id: params[:id]) }

      def index
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
        @shipment.destroy
      end
    end
  end
end
