module API
  module V1
    class LineItemsController < ApplicationController
      expose(:line_items) { LineItem.where(order_id: params[:order_id]) }
      expose(:line_item) { LineItem.find(params[:id]) }

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
