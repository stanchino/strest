class ApiRequest < ActiveRecord::Base
  include ApiRequestConstants

  attr_accessor :headerlist

  validates_inclusion_of :method, in: VALID_METHODS
  validates_presence_of :host, :uri

  def headerlist
    self.headers.split('\r\n')
  end

  def headerlist=(headerlist)
    self.headers = headerlist.join('\r\n')
  end
end
