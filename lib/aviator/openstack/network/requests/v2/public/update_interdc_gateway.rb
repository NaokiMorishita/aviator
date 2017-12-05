module Aviator
  define_request :update_interdc_gateway,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id,                    required: true
    param :name,                  required: false
    param :description,           required: false
    param :qos_option_id,         required: false
    param :maximum_static_routes, required: false

    def headers
      super
    end

    def body
      h = {}
      optional_params.each {|k| h[k] = params[k] if params[k] }
      return { interdc_gateway: h}
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/interdc_gateways/#{params['id']}"
    end
  end
end
