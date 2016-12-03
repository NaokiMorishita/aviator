module Aviator
  define_request :create_mcic,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :tenant_id,                     required: true
    param :mcic_name,                     required: true
    param :service_type,                  required: true
    param :application_date,              required: true
    param :expected_contract_start_date,  required: true
    param :billing_start_date,            required: true
    param :comment,                       required: false
    param :ngc_dc_tag,                    required: true
    param :ngc_mclag,                     required: true

    param :colo_dc_tag,                   required: true
    param :colo_port_a,                   required: true
    param :colo_port_b,                   required: true
    param :colo_connect_id_a,             required: true
    param :colo_connect_id_b,             required: true
    param :colo_mc_info_a,                required: true
    param :colo_mc_info_b,                required: true
    param :colo_rack_id_a,                required: true
    param :colo_rack_id_b,                required: true

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        tenant_id:                    params[:tenant_id],
        mcic_name:                    params[:mcic_name],
        service_type:                 params[:service_type],
        application_date:             params[:application_date],
        expected_contract_start_date: params[:expected_contract_start_date],
        billing_start_date:           params[:billing_start_date],
        ngc_dc_tag:                   params[:ngc_dc_tag],
        ngc_mclag:                    params[:ngc_mclag],
        colo_dc_tag:                  params[:colo_dc_tag],
        colo_port_a:                  params[:colo_port_a],
        colo_port_b:                  params[:colo_port_b],
        colo_connect_id_a:            params[:colo_connect_id_a],
        colo_connect_id_b:            params[:colo_connect_id_b],
        colo_mc_info_a:               params[:colo_mc_info_a],
        colo_mc_info_b:               params[:colo_mc_info_b],
        colo_rack_id_a:               params[:colo_rack_id_a],
        colo_rack_id_b:               params[:colo_rack_id_b]
      }

      [:comment].each do |key|
        p[key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/ecc/mCICs"
    end
  end
end
