module Aviator
  define_request :get_ec_service,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :service_id, required: true

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/ecc/ec_services/#{params['service_id']}"
    end
  end
end
