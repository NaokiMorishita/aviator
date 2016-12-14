module Aviator
  define_request :create_esi_subnet,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :name,            required: false
    param :description,     required: false
    param :network_id,      required: true
    param :cidr,            required: true
    param :ip_version,      required: false
    param :allocation_pools,required: false
    param :tenant_id,       required: false
    param :enable_dhcp,     required: false
    param :gateway_ip,      required: false
    param :host_routes,     required: false
    param :dns_nameservers, required: false
    param :ntp_servers,     required: false
    param :tags,            required: false

    def headers
      super
    end

    def body
      p = {
        subnet: {cidr: params[:cidr], network_id: params[:network_id] }
      }

      [:name, :description, :ip_version, :allocation_pools, :tenant_id,
       :enable_dhcp, :gateway_ip, :host_routes, :dns_nameservers,
       :ntp_servers].each do |key|
        p[:subnet][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/subnets"
    end
  end
end
