class HomeController < ApplicationController
  before_action :find_url_from_token

  def visit_shortened_url
    begin
      visit = @link.visits.new(ip: request.remote_ip)
      visit.save
      redirect_to @link.url.original, allow_other_host: true
    rescue => e
      redirect_to root_path, notice: e.message
    end
  end

  def shortened_url_info
  end

  private

  def find_url_from_token
    @link = Link.find_by(identifier: params[:token])
    redirect_to root_path unless @link.present?
  end
end