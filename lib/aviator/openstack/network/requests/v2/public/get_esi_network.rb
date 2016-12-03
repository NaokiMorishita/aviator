module Aviator
  define_request :get_esi_network,
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
      "#{base_url}/networks/#{params[:id]}"
    end
  end
end
