module Aviator
  define_request :get_ese_physical_port,
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
      "#{base_url}/ese_physical_ports/#{params[:id]}"
    end
  end
end
