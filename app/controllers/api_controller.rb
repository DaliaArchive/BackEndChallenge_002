require "json"

class ApiController < ApplicationController
  private

  def not_found
    error "Not found"
  end

  def error(message)
    render json: {
      "status" => "error",
      "message" => message
    }
  end
end
