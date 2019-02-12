module Api
  module V1
    class LineItemsController < ApplicationController
      def index
        @line_items = find_line_items(params[:order_id])
        render 'index.json.jbuilder'
      end

      def show
        @line_item = find_line_item(params[:id])
        render 'show.json.jbuilder'
      end

      def create
      end

      def update
      end

      def destroy
      end

      private

      def find_line_item(id)
        LineItem.find(id)
      end

      def find_line_items(order_id)
        LineItem.where(order_id: order_id)
      end
    end
  end
end
