module Aviator
  define_request :list_ngc_datacenters,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/ecc/private/ngc_datacenters"
    end
  end
end
