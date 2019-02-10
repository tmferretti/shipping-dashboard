module api
  class VendorsController < ApplicationController
    before_filter :load_vendor, :except => [:index, :create]

    def index
      @vendors = Vendor.all
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

  private

  def load_vendor
    @vendor = Vendor.find_by(id: params[:id])
  end
end
