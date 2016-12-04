module Aviator
  define_request :list_firewalls,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id, required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      params[:tenant_id] \
        ? "#{base_url}/firewalls?tenant_id=#{params[:tenant_id]}"
        : "#{base_url}/firewalls"
    end
  end
end
