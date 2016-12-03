module Aviator
  define_request :list_ese_physical_ports,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/ese_physical_ports"
    end
  end
end
