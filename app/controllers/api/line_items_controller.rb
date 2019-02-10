module api
  class LineItemsController < ApplicationController
    expose(:line_items) { LineItem.where(order_id: params[:order_id]) }
    expose(:line_item) { LineItem.find(params[:id]) }

    def index
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
    end
  end
end
