class Public::ItemsController < Public::Base
    def show
        
    end

    def index
        @all_items = Item.all
    end

end
