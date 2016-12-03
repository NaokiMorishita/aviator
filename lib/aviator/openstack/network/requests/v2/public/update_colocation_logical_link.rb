module Aviator
  define_request :update_colocation_logical_link,
    :inherit => [:openstack, :common, :'v2', :public, :base] do
    meta :service, :network

    param :id,                          required: true
    param :name,                        required: false
    param :description,                 required: false

    def headers
      super
    end

    def body
      # Mandatory parameters
      p = {
        colocation_logical_link: {}
      }

      [:name, :description].each do |key|
        p[:colocation_logical_link][key] = params[key] if params[key]
      end

      p
    end

    def http_method
      :put
    end

    def url
      "#{base_url}/colocation_logical_links/#{params[:id]}"
    end
  end
end
