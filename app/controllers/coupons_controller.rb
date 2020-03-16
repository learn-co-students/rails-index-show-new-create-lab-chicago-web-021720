    class CouponsController < ApplicationController
        #define your controller actions here
      
        def index
            @coupons = Coupon.all
        end
      
        def show
            @coupon = Coupon.find(params[:id])
        end
      
        def new
            @coupon = Coupon.new
        end
      
        def edit
            @coupon = Coupon.find(params[:id])
        end
      
        def create
            @coupon = Coupon.new(coupon_params)
            if @coupon.save
                redirect_to @coupon
            else
                render 'new'
            end
        end
      
        def update
            @coupon = Coupon.find(params[:id])
            if @coupon.update(coupon_params)
                redirect_to @coupon
            else
                render 'edit'
            end
        end
      
        def destroy
            Coupon.destroy(params[:id])
            redirect_to '/coupons'
        end
      
      
        private
        # In controller actions, use this private method to access coupon params from forms.
        # Example: @coupon.update(coupon_params)
        # check the return value of coupon_params to see what you're working with!
        def coupon_params
          params.require(:coupon).permit(:store, :coupon_code)
        end
      
      end
      