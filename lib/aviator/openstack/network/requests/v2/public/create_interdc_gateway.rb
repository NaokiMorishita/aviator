module Aviator
  define_request :create_interdc_gateway,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id,             required: true
    param :name,                  required: false
    param :description,           required: false
    param :interdc_service_id,    required: true
    param :qos_option_id,         required: true
    param :uplink_interface_id,   required: false
    param :uplink_vlan,           required: true
    param :maximum_static_routes, required: false

    def headers
      super
    end

    def body
      h = {}
      required_params.each {|k| h[k] = params[k] }
      optional_params.each {|k| h[k] = params[k] if params[k] }
      return { interdc_gateway: h}
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/interdc_gateways"
    end
  end
end
