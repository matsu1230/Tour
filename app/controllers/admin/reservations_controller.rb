# coding: utf-8

class Admin::ReservationsController < Admin::Base

#一覧
def index
  @reservations = Reservation.joins(:member)
  @detail = Detail.joins(:trip)
end

#詳細
def show
  @reservation = Reservation.find_by_id(params[:id])
  @detail = Detail.find_by_id(@reservation.detail_id)
  @trip = Trip.find_by_id(@detail.trip_id)
end

#新規
def new
 @detail = Detail.find_by_id(params[:id])
 @trip = Trip.find_by_id(@detail.trip_id)
 @member = @current_member
 @reservation = Reservation.new(detail_id: @detail.id, member_id: @member.id)
end

#作成
def create
  @reservation = Reservation.new(params[:reservation])
  if @reservation.save
    redirect_to @reservation
  else
    render "new"
  end 
end

#削除
def destroy
  @reservation = Reservation.find_by_id(params[:id])
    @reservation.destroy
    redirect_to :admin_reservations, notice: "予約を削除しました。"
end
end
