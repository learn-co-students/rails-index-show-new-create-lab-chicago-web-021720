class CouponsController < ApplicationController

    def index
        @coupons = Coupon.all
    end

    def show
        set_coupon
    end

    def create
        coupon = Coupon.create(coupon_params)
        redirect_to coupon_path(coupon)
    end

    def new
    end

    private

    def coupon_params
        params.require(:coupon).permit(:coupon_code, :store)
    end

    def set_coupon
        @coupon = Coupon.find(params[:id])
    end

end
