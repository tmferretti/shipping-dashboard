module api
  class AddressesController < ApplicationController
    before_filter :load_address, :except => [:index, :create]

    def index
      @addresses = Address.all
    end

    def show
    end

    def update
    end

    def create
    end

    def destroy
      @address.active = false
      @address.save
    end

    private

    def load_address
      @address = Address.find_by(id: params[:id])
    end
  end
end
