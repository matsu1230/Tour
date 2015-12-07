# coding: utf-8

class Admin::DetailsController < Admin::Base
def index
  #@details = Deatail.order("trip_id")
end

def show
end

def new
 @detail = Detail.new(trip_id: params[:id])
end

def edit
  @detail = Detail.find_by_id(params[:id])
end

def copy
  @detail = Detail.find_by_id(params[:id])
end

def create
  @detail = Detail.new(params[:detail])
  if @detail.save
    redirect_to :controller => 'admin/trips', :action => 'show', :id => @detail.trip_id
  else
    render "new"
  end 
end

def updata
    @detail = Detail.find_by_id(params[:id])
    @detail.assign_attributes(params[:detail])
    if @detail.save
      redirect_to @detail, notice: "ツアー情報を更新しました。"
    else
      render "edit"
    end
end

def destroy
    @detail = Detail.find_by_id(params[:id])
    @id = @detail.trip_id
    @detail.destroy
    redirect_to :controller => "admin/trips", :action => "show", :id => @id, notice: "詳細を削除しました。"
end
end

