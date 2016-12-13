module Aviator
  define_request :execute_tenant_connection,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id, required: true

    def headers
      super
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/tenant_connections/#{params[:id]}/execute"
    end
  end
end
