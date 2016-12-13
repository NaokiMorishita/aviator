module Aviator
  define_request :list_firewall_interfaces,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id,   required: false
    param :firewall_id, required: false
    param :type,        required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      query = params_to_querystring(optional_params)
      return "#{base_url}/firewall_interfaces#{query}"
    end
  end
end
