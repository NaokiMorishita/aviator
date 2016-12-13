module Aviator
  define_request :list_esi_subnets,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id,  required: false
    param :network_id, required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      query = params_to_querystring(optional_params)
      return "#{base_url}/subnets#{query}"
    end
  end
end
