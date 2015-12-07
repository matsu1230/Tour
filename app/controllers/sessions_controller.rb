# coding: utf-8

class SessionsController < ApplicationController
  skip_filter :store_location

  def show
    render "new"
  end

  def create
    member = Member.authenticate(params[:name], params[:password])
    if member
      session[:member_id] = member.id
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to session[:previous_url]
  end

  def destroy
    session.delete(:member_id)
    redirect_to :root
  end
end
