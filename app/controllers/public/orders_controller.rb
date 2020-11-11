class Public::OrdersController < Public::Base
    def new
        @new_order = Order.new
        @new_address = Address.new
    end

    def confirm
        @order= Order.new(order_params)
        @order.end_user_id = current_end_user.id
        if  params[:order][:select_address] == "0"
            @order.address = current_end_user.address
            @order.postal_code = current_end_user.postal_code
            @order.name = current_end_user.last_name + current_end_user.first_name
        elsif params[:order][:select_address] == "1"
            @choiced_address = Address.find(params[:order][:address_index])
            @order.address = @choiced_address.address
            @order.postal_code = @choiced_address.postal_code
            @order.name = @choiced_address.name
        elsif params[:order][:select_address] == "2"
            @new_address=Address.new(address_params)
            @new_address.end_user_id=current_end_user.id
            @new_address.save
        end
        @order.shipping_cost = 800
        @cart_items = current_end_user.cart_items

        @order_for_create = Order.new

    end

    def thanks

        
    end

    def create
        @order = Order.new(order_params)
        @order.save
        @cart_items = current_end_user.cart_items
        @cart_items.each do |f|
            @new_order_detail = OrderDetail.new
            @new_order_detail.order_id = @order.id
            @new_order_detail.item_id = f.item_id
            @new_order_detail.price = ((Item.find(f.item_id).price)*1.1).to_i
            @new_order_detail.amount = f.amount
            @new_order_detail.save
        end
        @cart_items.destroy_all
        redirect_to orders_thanks_path
    end

    def index
    end

    def show        
    end

    private

    def order_params
        params.require(:order).permit(:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:end_user_id)
    end

    def address_params
        params.require(:order).permit(:name,:address,:postal_code)
    end



end
