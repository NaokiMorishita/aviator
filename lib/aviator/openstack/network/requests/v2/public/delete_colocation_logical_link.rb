module Aviator
  define_request :delete_colocation_logical_link,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id, required: true

    def headers
      super
    end

    def http_method
      :delete
    end

    def url
      "#{base_url}/colocation_logical_links/#{params[:id]}"
    end
  end
end
