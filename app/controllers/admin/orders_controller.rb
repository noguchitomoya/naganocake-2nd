class Admin::OrdersController < Admin::Base

    def index
        @all_orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @all_order_details = @order.order_details
    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)


        if @order.status == "payment_confirmation"
            @order_details = @order.order_details
            @order_details.each do |f|
                f.update(making_status: "waiting_for_production")
            end
        end
        redirect_back(fallback_location: root_path)
    end
    
    private
    def order_params
        params.require(:order).permit(:status)
    end

end
