module Aviator
  define_request :delete_esi_subnet,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id, required: true

    def headers
      super
    end

    def http_method
      :delete
    end

    def url
      "#{base_url}/subnets/#{params[:id]}"
    end
  end
end
