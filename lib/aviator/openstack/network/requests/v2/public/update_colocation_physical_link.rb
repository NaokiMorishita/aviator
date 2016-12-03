module Aviator
  define_request :update_colocation_physical_link,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id,                          required: true
    param :name,                        required: false
    param :description,                 required: false
    param :type_a_cross_connect_id,     required: false
    param :type_a_rack_id,              required: false
    param :type_b_cross_connect_id,     required: false
    param :type_b_rack_id,              required: false

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        colocation_physical_link: {}
      }

      [:name, :description, :type_a_cross_connect_id, :type_a_rack_id,
       :type_b_cross_connect_id, :type_b_rack_id].each do |key|
        p[:colocation_physical_link][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/colocation_physical_links/#{params[:id]}"
    end
  end
end
