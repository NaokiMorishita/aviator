module Aviator
  define_request :list_interdc_gateways,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id,           required: false
    param :interdc_service_id,  required: false
    param :qos_option_id,       required: false
    param :uplink_vlan_id,      required: false
    param :downlink_vlan_id,    required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      uri = "#{base_url}/interdc_gateways"
      if not params.values.select{|k| k}.empty?
        uri += '?' +
          params.to_h.select{|k,v|v}.keys.map{|k|"#{k}=#{params[k]}"}.join('&')
      end
      return uri
    end
  end
end
