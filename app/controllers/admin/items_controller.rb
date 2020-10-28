class Admin::ItemsController < Admin::Base
    def index
        @all_items = Item.all
        
    end

    def new
        @new_item = Item.new
        
    end

    def create
        item = Item.new(item_params)
        item.genre_id = params[:item][:genre_id].to_i
        item.save
        redirect_back(fallback_location: root_path) 
        
    end

    def show
        
    end

    def edit
        
    end

    def update
        
    end

    private

    def item_params
        params.require(:item).permit(:name,:is_active,:image,:price,:introduction)
    end
end
