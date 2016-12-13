module Aviator
  define_request :create_firewall,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id,         required: true
    param :firewall_plan_id,  required: true
    param :name,              required: false
    param :description,       required: false
    param :availability_zone, required: false
    param :default_gateway,   required: false

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        firewall: {
          tenant_id:        params[:tenant_id],
          firewall_plan_id: params[:firewall_plan_id]
        }
      }

      optional_params.each do |key|
        p[:firewall][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/firewalls"
    end
  end
end
