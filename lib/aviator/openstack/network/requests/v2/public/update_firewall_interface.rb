module Aviator
  define_request :update_firewall_interface,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id,                    required: true
    param :name,                  required: false
    param :description,           required: false
    param :ip_address,            required: false
    param :network_id,            required: false
    param :virtual_ip_address,    required: false
    param :virtual_ip_properties, required: false

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = { firewall_interface: {} }

      optional_params.each do |key|
        p[:firewall_interface][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/firewall_interfaces/#{params[:id]}"
    end
  end
end
