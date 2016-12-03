module Aviator
  define_request :list_colocation_logical_links,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id,                   required: false
    param :colocation_physical_link_id, required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      if params[:tenant_id]
        "#{base_url}/colocation_logical_links?tenant_id=#{params[:tenant_id]}"
      elsif params[:colocation_physical_link_id]
        "#{base_url}/colocation_logical_links?colocation_physical_link_id=" +
        "#{params[:colocation_physical_link_id]}"
      else
        "#{base_url}/colocation_logical_links"
      end
    end
  end
end
