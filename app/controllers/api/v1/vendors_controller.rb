module Api
  module V1
    class VendorsController < ApplicationController
      expose(:vendors) { Vendor.all }
      expose(:vendor) { Vendor.find(params[:id]) }

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
