module Aviator
  define_request :list_colocation_spaces,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/colocation_spaces"
    end
  end
end
