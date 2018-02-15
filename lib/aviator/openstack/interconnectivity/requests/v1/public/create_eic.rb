module Aviator
  define_request :create_eic,
                 :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :mcic_id,             required: true
    param :cic_name,            required: true
    param :network_id,          required: true
    param :server_segment_nbr,  required: true

    def headers
      super
    end

    def body
      # Mandatory parameter
      p = {
        cic_name:           params[:cic_name],
        network_id:         params[:network_id],
        server_segment_nbr: params[:server_segment_nbr]
      }
      p
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/ecc/mCICs/#{params[:mcic_id]}/CICs"
    end
  end
end
