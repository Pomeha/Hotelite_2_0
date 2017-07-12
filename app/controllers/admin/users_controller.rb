module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate prototype.herokuapp.com/customizing_controller_actions
    # for more information
    # def edit
    #   @user = User.find(params[:id])
    # end

  # PATCH/PUT /admin/users/1
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @admin_user, notice: 'User was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name)
    end
  end
end
