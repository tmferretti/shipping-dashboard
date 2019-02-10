module api
  class VendorsController < ApplicationController
    expose(:vendors) { Vendor.all }
    expose(:vendor) { Vendor.find(params[:id]) }

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
