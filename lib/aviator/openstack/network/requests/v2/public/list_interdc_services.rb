module Aviator
  define_request :list_interdc_services,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :zone, required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      uri = "#{base_url}/interdc_services"
      if not params.values.select{|k| k}.empty?
        uri += '?' +
          params.to_h.select{|k,v|v}.keys.map{|k|"#{k}=#{params[k]}"}.join('&')
      end
      return uri
    end
  end
end
