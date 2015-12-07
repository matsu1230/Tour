class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize, :store_location

  class Forbidden < StandardError; end

  def return_back
    if request.referer
      redirect_to :back and return
    elsif @request_from
      redirect_to @request_from and return
    end
    return false
  end


  private
  def authorize
    if session[:member_id]
      @current_member = Member.find_by_id(session[:member_id])
      session.delete(:member_id) unless @current_member
    end
  end

    def store_location
      session[:previous_url] = request.url
    end


  def login_required
    #raise Forbidden unless @current_member
    unless @current_member
    redirect_to :session
    end
  end
end
