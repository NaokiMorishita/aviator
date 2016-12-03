module Aviator
  define_request :create_colocation_logical_link,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id,                   required: true
    param :colocation_physical_link_id, required: true
    param :name,                        required: false
    param :description,                 required: false
    param :network_id,                  required: true
    param :vlan_id,                     required: true

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        colocation_logical_link: {
          tenant_id:                    params[:tenant_id],
          colocation_physical_link_id:  params[:colocation_physical_link_id],
          network_id:                   params[:network_id],
          vlan_id:                      params[:vlan_id]
        }
      }

      [:name, :description].each do |key|
        p[:colocation_logical_link][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/colocation_logical_links"
    end
  end
end
