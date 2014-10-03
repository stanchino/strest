module ApiRequestConstants
  extend ActiveSupport::Concern

  HEAD = :head
  OPTIONS = :options
  POST = :post
  GET = :get
  PUT = :put
  PATCH = :patch
  DELETE = :delete

  VALID_METHODS = [HEAD, OPTIONS, POST, GET, PUT, PATCH, DELETE].freeze
end
