module Aviator
  define_request :update_mcic,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :mcic_id,                       required: true
    param :mcic_status,                   required: false
    param :mcic_name,                     required: false
    param :application_date,              required: false
    param :application_updating_date,     required: true
    param :expected_contract_start_date,  required: false
    param :billing_start_date,            required: false
    param :comment,                       required: false

    param :colo_connect_id_a,             required: false
    param :colo_connect_id_b,             required: false
    param :colo_mc_info_a,                required: false
    param :colo_mc_info_b,                required: false
    param :colo_rack_id_a,                required: false
    param :colo_rack_id_b,                required: false

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        application_updating_date: params[:application_updating_date],
      }

      [:mcic_name, :application_date, :application_updating_date,
       :expected_contract_start_date, :billing_start_date, :comment,
       :colo_connect_id_a, :colo_connect_id_b, :colo_mc_info_a, :colo_mc_info_b,
       :colo_rack_id_a, :colo_rack_id_b].each do |key|
        p[key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/ecc/mCICs/#{params[:mcic_id]}"
    end
  end
end
