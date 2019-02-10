module API
  module V1
    class AddressesController < ApplicationController
      expose(:addresses) { Address.where(shipment_id: params[:shipment_id]) } if params[:shipment_id]
      expose(:addresses) { Address.where(vendor_id: params[:vendor_id]) } if params[:vendor_id]
      expose(:address) { Address.find(params[:id]) }

      def index
      end

      def show
      end

      def update
      end

      def create
      end

      def destroy
        @address.destroy
      end
    end
  end
end
