# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action do
      redirect_to new_user_session_path unless current_user && current_user.admin?
    end

    def index
      resources=scoped_resource.all
      if params[scoped_resource.name]
        params[scoped_resource.name].each_pair do |key,value|
          resources=resources.where(resources.arel_table[key].matches("%#{value}%") ) if !value.empty?
        end
      end
      
      search_term=params[scoped_resource.name]

      #resources = Administrate::Search.new(scoped_resource,
      #                                     dashboard_class,
      #                                     search_term).run
      #
      #resources=Hotel.all.limit(5)
      #debugger
      resources = resources.includes(*resource_includes) if resource_includes.any?
      resources = order.apply(resources)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page
      }
    end
    def authenticate_admin
      # TODO Add authentication logic here.
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
