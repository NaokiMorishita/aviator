module Aviator
  define_request :create_esi_network,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :name,            required: false
    param :description,     required: false
    param :plane,           required: false
    param :tenant_id,       required: false
    param :admin_state_up,  required: false

    def headers
      super
    end

    def body
      p = { network: {} }
      optional_params.each do |key|
        p[:network][key] = params[key] if params[key]
      end

      return p
    end

    def http_method
      :post
    end

    def url
      "#{base_url}/networks"
    end
  end
end
