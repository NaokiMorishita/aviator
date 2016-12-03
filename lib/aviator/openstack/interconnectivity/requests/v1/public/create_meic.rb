module Aviator
  define_request :create_meic,
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

    param :service_id,                    required: true
    param :ec_dc_tag,                     required: true
    param :ec_mclag,                      required: true

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
        service_id:                   params[:service_id],
        ec_dc_tag:                    params[:ec_dc_tag],
        ec_mclag:                     params[:ec_mclag]
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
