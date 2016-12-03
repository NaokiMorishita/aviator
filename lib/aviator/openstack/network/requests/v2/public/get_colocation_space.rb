module Aviator
  define_request :get_colocation_space,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id, required: true

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/colocation_spaces/#{params[:id]}"
    end
  end
end
