# Author: Hiroshi Ichikawa <http://gimite.net/>
# The license of this source is "New BSD Licence"

require "google_drive/basic_fetcher"


module GoogleDrive

    class OAuth2Fetcher < BasicFetcher #:nodoc:

        def initialize(auth_token, proxy)
          super(proxy)
          @auth_token = auth_token
        end

        def client
          client = Google::APIClient.new
          client.authorization.access_token = @auth_token
          client
        end

      private

        def auth_header(auth)
          return {"Authorization" => "Bearer %s" % @auth_token}
        end

    end

end
