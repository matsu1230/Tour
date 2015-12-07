# coding: utf-8
class ReservationsController < ApplicationController
before_filter :login_required
#一覧
def index
 @reservations = Reservation.joins(:member, :detail)
 @trips = Trip.all
end
#詳細
def show
  @member = @current_member
  @reservation = Reservation.find_by_id(params[:id])
  @detail = Detail.find_by_id(@reservation.detail_id)
  @trip = Trip.find_by_id(@detail.trip_id)
  @sum = @detail.price*@reservation.people
end
#ユーザ確認
def confirmation
  @member = @current_member
  @reservation = Reservation.new(params[:reservation])
  @detail = Detail.find_by_id(@reservation.detail_id)
  @trip = Trip.find_by_id(@detail.trip_id)
  @sum = @detail.price*@reservation.people
  render "confirmation"
end
#予約キャンセル
def canceld
  @reservation = Reservation.find_by_id(params[:id])
  @reservation.canceld = true;
end

#新規
def new
 @trip = Trip.find_by_id(params[:id])
 @detail = Detail.find_by_id(params[:detail])
 @member = @current_member
 @reservation = Reservation.new(detail_id: @detail.id, member_id: @member.id)
end
#編集
def edit
 @reservation = Reservation.find_by_id(params[:id])
end
#作成
def create
  @member = @current_member
  @reservation = Reservation.new(params[:reservation], member_id: @member.id)
  if @reservation.save
    redirect_to :root, notice: "予約しました。"
  else
    render "new"
  end 
end
#更新
def update
   @reservation = Reservation.find(params[:id])
   @reservation.assign_attributes(params[:reservation])
    if @reservation.save
      redirect_to @current_member
    else
      render "edit"
    end
end
#削除
def destroy
    @reservation = Reservation.find_by_id(params[:id])
    @reservation.destroy
    redirect_to "new", notice: "ツアーを削除しました。"
end
end
