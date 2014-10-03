class ApiRequestsController < ApplicationController
  def index
    @api_requests = ApiRequest.limit(10)
  end
end
