# coding: utf-8

class Admin::TripsController < Admin::Base
  def index
    @trips = Trip.order("id")
  end

  def search
    @trips = Trip.search(params[:q])
    render "admin_trips"
  end

  def show
    @trip = Trip.find_by_id(params[:id])
    @detail = Detail.where("trip_id = ?",params[:id])
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
      redirect_to :controller => 'admin/details', :action => "new", :id => @trip.id, notice: "ツアーを登録しました。"
    else
      render "new"
    end
  end

  def update
    @trip = Trip.find_by_id(params[:id])
    @trip.assign_attributes(params[:trip])
    if @trip.save
      redirect_to [:admin, @trip], notice: "ツアー情報を更新しました。"
    else
      render [:admin, :edit, @trip]
    end
  end

  def destroy
    @trip = Trip.find_by_id(params[:id])
    @trip.destroy
    redirect_to [:admin ,:trips], notice: "ツアーを削除しました。"
  end
end
