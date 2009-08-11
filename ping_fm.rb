require 'rest_client'

# Simple library to automate posting to ping.FM service.
# 
# Uses the v1 API:
# http://groups.google.com/group/pingfm-developers/web/api-documentation?_done=%2Fgroup%2Fpingfm-developers%3F
#
# Could totally use some work:
# 
# * opts parsing in each call to make sure required fields are sent and 
#   optional too
# * some optional meta or defining a method_missing to attempt to
#   handle all API methods automatically
# * reading of config through a yaml for API keys
# * parsing of the xml_result into a ruby hash or something cooler using 
#   xml-simple or lib-xml
# * more awesomeness....
#
# 
class PingFM
  
  API_KEY = "YOUR API KEY"
  USER_API_KEY = "YOUR USER API KEY"
  
  def self.user_post(post_method, body, opts = {})
    params = {:api_key => API_KEY, 
              :user_app_key => USER_API_KEY, 
              :post_method => post_method,
              :body => body}.merge(opts)
    xml_result = RestClient.post("http://api.ping.fm/v1/user.post", params)
  end
  
end