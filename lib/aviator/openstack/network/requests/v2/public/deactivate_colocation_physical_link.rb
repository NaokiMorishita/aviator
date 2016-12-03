module Aviator
  define_request :deactivate_colocation_physical_link,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id, required: true

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        colocation_physical_link: {
          admin_state_up: false
        }
      }

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/colocation_physical_links/#{params[:id]}"
    end
  end
end
