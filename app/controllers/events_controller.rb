class EventsController < WebsocketRails::BaseController
  around_filter :time_request

  def initialize_session
    controller_store[:request] = nil
  end

  def get_request
    current_request = ApiRequest.where(id: message[:id]).first
    controller_store[:request] = current_request
    broadcast_message :exec, current_request.attributes, :channel => :requests
  end

  def add_response
    current_request = controller_store[:request]
    Resque.enqueue(SaveResponse, current_request.id, message)
    broadcast_message :update, message, :channel => :requests
  end

  def time_request
    start = Time.now
    yield
    delta = Time.now - start
    puts "Action took #{delta.to_f} seconds"
  end
end
