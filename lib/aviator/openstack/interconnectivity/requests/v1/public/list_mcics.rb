module Aviator
  define_request :list_mcics,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :tenant_id, required: true

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/ecc/mCICs?tenant_id=#{params[:tenant_id]}"
    end
  end
end
