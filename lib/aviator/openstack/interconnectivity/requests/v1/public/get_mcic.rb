module Aviator
  define_request :get_mcic,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :mcic_id, required: true

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/ecc/mCICs/#{params[:mcic_id]}"
    end
  end
end
