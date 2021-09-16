class ApplicationController < ActionController::Base
  helper_method :htmx_request?

  def htmx_request?
    request.headers['HX-Request'] == 'true'
  end
end
