class ExternalServicesController < ApplicationController
  before_action :authenticate?

  def tweet
    request_params = {
      text: params[:text],
      url: params[:image_url]
    }
    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{session[:access_token]}"
    }
    uri = URI.parse(ENV['TWEET_URL'])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"
    response = http.post(uri.path, request_params.to_json, headers)
    p response.body if response.code != 200

    redirect_to user_photos_path(current_user)
  end

  def auth
    uri = URI.parse(ENV['AUTH_URL'])
    uri.query = URI.encode_www_form(
      {
        client_id: ENV['CLIENT_ID'],
        response_type: 'code',
        redirect_uri: ENV['REDIRECT_URL']
      }
    )
    redirect_to uri.origin + uri.request_uri
  end

  def callback
    request_params = {
      code: params[:code],
      client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      redirect_uri: ENV['REDIRECT_URL'],
      grant_type: "authorization_code"
    }
    uri = URI.parse(ENV['AUTH_POST_URL'])
    response = Net::HTTP.post_form(uri, request_params)
    parsed_body = JSON.parse(response.body)
    session[:access_token] = parsed_body['access_token']
    redirect_to user_photos_path(current_user)
  end
end
