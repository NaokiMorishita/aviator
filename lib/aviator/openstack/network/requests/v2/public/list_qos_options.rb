module Aviator
  define_request :list_qos_options,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :service_type,        required: false
    param :qos_type,            required: false
    param :internet_service_id, required: false
    param :vpn_service_id,      required: false
    param :interdc_service_id,  required: false
    param :aws_service_id,      required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      uri =  "#{base_url}/qos_options"
      if not params.values.select{|k| k}.empty?
        uri += '?' +
          params.to_h.select{|k,v|v}.keys.map{|k|"#{k}=#{params[k]}"}.join('&')
      end
      return uri
    end
  end
end
