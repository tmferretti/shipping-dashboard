module Api
  module V1
    class VendorsController < ApplicationController
      def index
        @vendors = get_vendors

        # frontend expects content-range header for pagination
        set_content_range('vendors', params[:range], @vendors.count)

        render 'index.json.jbuilder'
      end

      def show
        @vendor = find_vendors(params[:id])
        render 'show.json.jbuilder'
      end

      def create
      end

      def update
      end

      def destroy
      end

      private

      def get_vendors
        Vendor.all
      end

      def find_vendor(id)
        Vendor.find(id)
      end
    end
  end
end
