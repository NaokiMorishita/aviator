module Aviator
  define_request :list_server_segments,
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
      "#{base_url}/ecc/ec_services/#{params['service_id']}/server_segments"
    end
  end
end
