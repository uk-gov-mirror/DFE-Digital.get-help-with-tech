class Computacenter::OutgoingAPI::CapUpdateRequest
  attr_accessor :endpoint, :username, :password, :allocation_ids
  attr_accessor :body, :payload_id, :response, :logger

  def initialize(args = {})
    @endpoint       = args[:endpoint] || setting(:endpoint)
    @username       = args[:username] || setting(:username)
    @password       = args[:password] || setting(:password)
    @allocation_ids = args[:allocation_ids]
    @logger         = args[:logger] || Rails.logger
  end

  def post!
    # Need to regenerate this for every request
    @payload_id = SecureRandom.uuid
    @body = construct_body

    @logger.debug("POSTing to Computacenter, payload_id: #{@payload_id}, body: \n#{@body}")
    @response = HTTP.basic_auth(user: @username, pass: @password)
                    .post(@endpoint, body: @body)
    handle_response!
  end

  def handle_response!
    response_body = @response.body.to_s
    @logger.debug("Response from Computacenter: \n#{response_body}")
    unless @response.status.success?
      raise(
        Computacenter::OutgoingAPI::Error,
        "Computacenter responded with #{@response.status}, response_body: #{response_body}",
      )
    end

    @response
  end

  def setting(name)
    Settings.computacenter.outgoing_api.send(name)
  end

  def construct_body
    allocations = SchoolDeviceAllocation.where(id: @allocation_ids)
    renderer.render :cap_update_request, format: :xml, assigns: { allocations: allocations, payload_id: @payload_id }
  end

  def renderer
    Computacenter::OutgoingAPI::BaseController
  end
end