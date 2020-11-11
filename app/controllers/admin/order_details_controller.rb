class Admin::OrderDetailsController < Admin::Base

    def update
     
        @order_detail = OrderDetail.find(params[:id])
        @order_detail.update(order_detail_params)

        if @order_detail.order.order_details.where(making_status: "in_production").present?
            @order_detail.order.update(status: "in_production")
        end

        if @order_detail.order.order_details.where(making_status: "production_completed").count ==  @order_detail.order.order_details.count
            @order_detail.order.update(status: "preparing_to_ship")
        end
        redirect_back(fallback_location: root_path)
    end

    private
    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end
end
