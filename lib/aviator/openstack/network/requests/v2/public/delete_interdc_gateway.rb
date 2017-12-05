module Aviator
  define_request :delete_interdc_gateway,
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
      "#{base_url}/interdc_gateways/#{params[:id]}"
    end
  end
end
