module Aviator
  define_request :create_tenant_connection,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :name,                                      required: false
    param :description,                               required: false
    param :tenant_id,                                 required: false
    param :interface_type,                            required: true
    param :connected_interface_id,                    required: true
    param :connected_interface_ip_address,            required: true
    param :connected_interface_virtual_ip_address,    required: false
    param :connected_interface_virtual_ip_properties, required: false
    param :connected_network_id,                      required: true
    param :connected_network_tenant_id,               required: true

    def headers
      super
    end

    def body
      p = {
        tenant_connection: {
          connected_interface: {
            id: params[:connected_interface_id],
            ip_address: params[:connected_interface_ip_address]
          },
          connected_network: {
            id: params[:connected_network_id],
            tenant_id: params[:connected_network_tenant_id]
          },
          interface_type: params[:interface_type]
        }
      }

      [:name, :description, :tenant_id].each do |key|
        p[:tenant_connection][key] = params[key] if params[key]
      end

      if params[:connected_interface_virtual_ip_address]
        p[:tenant_connection][:connected_interface][:virtual_ip_address] =
          params[:connected_interface_virtual_ip_address]
      end

      if params[:connected_interface_virtual_ip_properties]
        p[:tenant_connection][:connected_interface][:virtual_ip_properties] =
          params[:connected_interface_virtual_ip_properties]
      end

      p
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/tenant_connections"
    end
  end
end
