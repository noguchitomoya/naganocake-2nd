class Public::EndUsersController < Public::Base
    def show 
        
    end

    def edit
        @enduser = current_end_user
    end

    def update
        @enduser = current_end_user
        if @enduser.update(end_user_params)
            redirect_to end_users_my_page_path
        else
            redirect_to end_users_edit_path
        end

    end

    def unsubscribe
    end

    def withdraw
        current_end_user.update(is_active: false)
        current_end_user.destroy
        redirect_to root_path
    end

    def end_user_params
        params.require(:end_user).permit(:first_name,:last_name,:last_name_kana,:first_name_kana,
            :postal_code,:address,:telephone_number,:is_active)
    end
end
