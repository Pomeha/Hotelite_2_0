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
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
        if requested_resource.update(resource_params)
          redirect_to(
            [namespace, requested_resource],
            notice: translate_with_resource("update.success"),
          )
        else
          render :edit, locals: {
            page: Administrate::Page::Form.new(dashboard, requested_resource),
          }
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
