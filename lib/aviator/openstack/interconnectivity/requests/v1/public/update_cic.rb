module Aviator
  define_request :update_cic,
                 :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :cic_id,   required: true
    param :mcic_id,  required: true
    param :cic_name, required: true

    def headers
      super
    end

    def body
      # Mandatory parameter
      p = {
        cic_name: params[:cic_name]
      }
      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/ecc/mCICs/#{params[:mcic_id]}/CICs/#{params[:cic_id]}"
    end
  end
end
