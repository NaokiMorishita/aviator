module Aviator
  define_request :update_esi_network,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id,              required: true
    param :name,            required: false
    param :description,     required: false
    param :admin_state_up,  required: false

    def headers
      super
    end

    def body
      p = {
        network: {}
      }

      [:name, :description, :admin_state_up].each do |key|
        p[:network][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/networks/#{params[:id]}"
    end
  end
end
