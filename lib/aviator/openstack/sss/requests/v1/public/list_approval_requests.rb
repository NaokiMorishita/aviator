module Aviator
  define_request :list_approval_requests,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :sss
    meta :api_version, :v1

    param :status,  required: false
    param :service, required: false

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      query = params_to_querystring(optional_params)
      return "#{base_url}/approval-requests#{query}"
    end
  end
end
