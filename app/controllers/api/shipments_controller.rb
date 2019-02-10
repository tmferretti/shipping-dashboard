module api
  class ShipmentsController < ApplicationController

    def index
      @vendor = Order.find_by(params[:vendor_id])
      @shipments = @vendor.shipments
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
