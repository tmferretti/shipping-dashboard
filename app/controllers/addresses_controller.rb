module api
  class AddressesController < ApplicationController
    def index
      @addresses = Address.all
    end

    def show
      @address = Address.find_by(id: params[:id])
    end

    def update
    end

    def create
    end

    def destroy
      address = Address.find_by(id: params[:id])
      address.active = false
      address.save
    end
  end
end
