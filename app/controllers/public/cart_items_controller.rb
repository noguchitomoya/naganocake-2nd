class Public::CartItemsController < Public::Base
    def index
        @all_cart_items = current_end_user.cart_items
        
    end

    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_back(fallback_location: root_path) 
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_back(fallback_location: root_path) 
    end

    def destroy_all
        @all_cart_items = current_end_user.cart_items
        @all_cart_items.destroy_all
        redirect_back(fallback_location: root_path) 
        
    end

    def create
        @old_cart_item=current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
        if @old_cart_item.present?
            @old_cart_item.amount += params[:cart_item][:amount].to_i
            @old_cart_item.save
        else
            @new_cart_item = CartItem.new(cart_item_params)
            @new_cart_item.end_user_id = current_end_user.id
            @new_cart_item.item_id = params[:cart_item][:item_id].to_i
            @new_cart_item.save
        end
            redirect_to cart_items_path
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:amount)
    end

    
end
