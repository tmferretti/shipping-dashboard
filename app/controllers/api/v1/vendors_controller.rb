module Api
  module V1
    class VendorsController < ApplicationController
      def index
        @vendors = get_vendors
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
