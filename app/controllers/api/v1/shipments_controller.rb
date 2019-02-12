module Api
  module V1
    class ShipmentsController < ApplicationController
      def index
        @shipments = find_shipments(order_id: params[:order_id], vendor_id: params[:vendor_id])
        render 'index.json.jbuilder'
      end

      def show
        @shipment = find_shipment(params[:id])
        render 'show.json.jbuilder'
      end

      def create
      end

      def update
      end

      def destroy
        @shipment.destroy
      end

      private

      def find_shipment(id)
        Shipment.find(id)
      end

      def find_shipments(order_id: nil, vendor_id: nil)
        # since both vendors and orders have shipments, we share the index route between them,
        # normally, this would introduce some unnecessary complexity into the view, however this is an api
        # so its not a problem

        if order_id
          Shipment.where(order_id: order_id)
        else
          Shipment.where(vendor_id: vendor_id)
        end
      end
    end
  end
end
