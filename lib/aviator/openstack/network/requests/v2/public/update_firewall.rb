module Aviator
  define_request :update_firewall,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id,                required: true
    param :name,              required: false
    param :description,       required: false
    param :firewall_plan_id,  required: false
    param :default_gateway,   required: false

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = { firewall: {} }

      optional_params.each do |key|
        p[:firewall][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/firewalls/#{params[:id]}"
    end
  end
end
