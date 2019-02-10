module api
  class OrdersController < ApplicationController
    before_filter :load_order, :except => [:index, :create]
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

    private

    def load_order
      @order = Order.find_by(id: params[:id])
    end
  end
end
