module Aviator
  define_request :get_esi_subnet,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id, required: true

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/subnets/#{params[:id]}"
    end
  end
end
