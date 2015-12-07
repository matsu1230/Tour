# coding: utf-8

class TripsController < ApplicationController
  def index
    @trips = Trip.order("id")
  end

  def search
    @trips = Trip.search(params[:q])
    render "index"
  end

  def show
    num = 0
    @trip = Trip.find_by_id(params[:id])
    @detail = Detail.where("trip_id = ?",params[:id])
    @people = Reservation.order("detail_id")
    @member = @current_member
    @detail.each do |detail|
      @people.each do |people|
       if people.detail_id == detail.id
         num += people.people
       end
       if @member
         if people.member_id == @member.id && people.detail_id == detail.id
           @flag = 1
         end
       end
      end
       nin = detail.limit - num
       @num = nin
     end
    @review = Review.where("trip_id = ?", @trip.id)
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find_by_id(params[:id])
  end

  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      redirect_to :controller => 'details', :action => 'new', :id => @trip.id, notice: "ツアーを登録しました。"
    else
      render "new"
    end
  end

  def update
    @trip = Trip.find_by_id(params[:id])
    @trip.assign_attributes(params[:trip])
    if @trip.save
      redirect_to @trip, notice: "ツアー情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @trip = Trip.find_by_id(params[:id])
    @trip.destroy
    redirect_to :trips, notice: "ツアーを削除しました。"
  end
end
