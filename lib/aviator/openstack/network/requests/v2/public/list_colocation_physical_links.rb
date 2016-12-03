module Aviator
  define_request :list_colocation_physical_links,
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
       ? "#{base_url}/colocation_physical_links?tenant_id=#{params[:tenant_id]}"
       : "#{base_url}/colocation_physical_links"
    end
  end
end
