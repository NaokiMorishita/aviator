module Aviator
  define_request :create_colocation_physical_link,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :tenant_id,                   required: true
    param :name,                        required: false
    param :description,                 required: false
    param :colocation_space_id,         required: true
    param :bandwidth,                   required: true
    param :type_a_cross_connect_id,     required: true
    param :type_a_rack_id,              required: true
    param :type_a_ese_physical_port_id, required: true
    param :type_b_cross_connect_id,     required: true
    param :type_b_rack_id,              required: true
    param :type_b_ese_physical_port_id, required: true

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        colocation_physical_link: {
          tenant_id:                    params[:tenant_id],
          colocation_space_id:          params[:colocation_space_id],
          bandwidth:                    params[:bandwidth],
          type_a_cross_connect_id:      params[:type_a_cross_connect_id],
          type_a_rack_id:               params[:type_a_rack_id],
          type_a_ese_physical_port_id:  params[:type_a_ese_physical_port_id],
          type_b_cross_connect_id:      params[:type_b_cross_connect_id],
          type_b_rack_id:               params[:type_b_rack_id],
          type_b_ese_physical_port_id:  params[:type_b_ese_physical_port_id]
        }
      }

      [:name, :description].each do |key|
        p[:colocation_physical_link][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/colocation_physical_links"
    end
  end
end
