module Api
  module V1
    class AddressesController < ApplicationController
      def index
        @addresses = find_addresses(shipment_id: params[:shipment_id], vendor_id: params[:vendor_id])
        render 'index.json.jbuilder'
      end

      def show
        @address = find_address(params[:id])
        render 'show.json.jbuilder'
      end

      def update
      end

      def create
      end

      def destroy
        @address.destroy
      end

      private

      def find_address(id)
        Address.find(id)
      end

      def find_addresses(shipment_id:, vendor_id:)
        # since both vendors and shipments have addresses, we share this index route between them,
        # normally, this would introduce some weird complexity into the view, however this is an api
        # so its not a problem

        if shipment_id
          Address.where(vendor_id: vendor_id)
        else
          Address.where(shipment_id: shipment_id)
        end
      end
    end
  end
end