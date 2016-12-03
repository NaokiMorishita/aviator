module Aviator
  define_request :list_projects, :inherit => [:openstack, :common, :v3, :public, :base] do
    meta :service, :identity
    meta :api_version, :v3
    link 'documentation',
         'http://developer.openstack.org/api-ref-identity-v3.html'

    def headers
      super
    end

    def http_method
      :get
    end

    def url
      "#{base_url}/projects"
    end
  end
end
