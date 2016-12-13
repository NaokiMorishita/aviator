module Aviator
  define_request :update_esi_subnet,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id,              required: true
    param :name,            required: false
    param :description,     required: false
    param :dns_nameservers, required: false
    param :enable_dhcp,     required: false
    param :gateway_ip,      required: false
    param :host_routes,     required: false
    param :ntp_servers,     required: false
    param :tags,            required: false

    def headers
      super
    end

    def body
      p = {
        subnet: {}
      }

      [:name, :description, :dns_nameservers, :enable_dhcp, :gateway_ip,
       :host_routes, :ntp_servers].each do |key|
        p[:subnet][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/subnets/#{params[:id]}"
    end
  end
end
