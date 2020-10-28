class Public::ItemsController < Public::Base
    def index
        @all_items = Item.all
    end

    def show
        @item = Item.find(params[:id])
        @new_cart_item = CartItem.new
    end

end
