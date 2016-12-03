module Aviator
  define_request :delete_mcic,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :mcic_id,                       required: true
    param :application_termination_date,  required: true
    param :contract_termination_date,     required: true
    param :billing_termination_date,      required: true
    param :comment,                       required: false

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        mcic_status:                  'inactive',
        application_termination_date: params[:application_termination_date],
        contract_termination_date:    params[:contract_termination_date],
        billing_termination_date:     params[:billing_termination_date]
      }

      [:comment].each do |key|
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
