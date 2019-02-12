class ApplicationController < ActionController::API

  def set_content_range(resource, range, count)
    response.headers['Content-Range'] = "#{resource} #{range.first}-#{range.last}/#{count}"
  end
end
