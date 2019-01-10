class RepositoriesController < ApplicationController
  
  def index
    resp = Faraday.get("https://api.foursquare.com/v2/users/self/friends") do |req|
    req.params['oauth_token'] = session[:token]
    # don't forget that pesky v param for versioning
    req.params['v'] = '20160201'
  end
  
    @repos = JSON.parse(resp.body)
  
  end

end
