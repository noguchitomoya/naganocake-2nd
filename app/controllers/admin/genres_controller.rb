class Admin::GenresController < Admin::Base
    def index
        @new_genre = Genre.new
        @genres = Genre.all
        
    end

    def create
        genre = Genre.new(genre_params)
        genre.save
        redirect_back(fallback_location: root_path) 
        
    end

    def edit
        @edit_genre = Genre.find(params[:id])
        
    end

    def update
        genre = Genre.find(params[:id])
        genre.update(genre_params)
        redirect_to admin_genres_path
        
    end

    def genre_params
        params.require(:genre).permit(:name,:is_active)
    end
end
