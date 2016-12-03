module Aviator
  define_request :list_datacenters,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :interconnectivity
    meta :api_version, :v1

    param :dc_type,     required: true
    param :dc_tag,      required: false
    param :cic_domain,  required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      uri = "#{base_url}/ecc/datacenters?dc_type=#{params['dc_type']}"
      if params['dc_tag']
        uri += "&dc_tag=#{params['dc_tag']}"
      elsif params['cic_domain']
        uri += "&cic_domain=#{params['cic_domain']}"
      end
      uri
    end
  end
end
