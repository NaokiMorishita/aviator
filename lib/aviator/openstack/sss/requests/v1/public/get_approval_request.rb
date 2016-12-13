module Aviator
  define_request :get_approval_request,
    :inherit => [:openstack, :common, :'v0', :public, :base] do
    meta :service, :sss
    meta :api_version,:v1

    param :id, required: true

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/approval-requests/#{params[:id]}"
    end
  end
end
