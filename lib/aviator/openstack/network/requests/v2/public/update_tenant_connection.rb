module Aviator
  define_request :update_tenant_connection,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id,          required: true
    param :name,        required: false
    param :description, required: false

    def headers
      super
    end

    def body
      p = { tenant_connection: {} }

      optional_params.each do |key|
        p[:tenant_connection][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/tenant_connections/#{params[:id]}"
    end
  end
end
