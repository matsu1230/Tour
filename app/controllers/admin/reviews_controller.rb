# coding: utf-8

class Admin::ReviewsController < Admin::Base
def index
 @reviews = Review.joins(:trip,:member)
end
def show
 @review = Review.find_by_id(params[:id])
 @trip = Trip.find_by_id(@review.trip_id)
end
def new 
 @member = @current_member
 @review = Review.new(trip_id: params[:id], member_id: @member.id)
end
def edit
 @review = Review.find_by_id(params[:id])
end
def create
  @review = Review.new(params[:review])
  if @review.save
    redirect_to [:admin, @review]
  else
    render "new"
  end 
end
def update
 @review = Review.find(params[:id])
 @review.assign_attributes(params[:review])
  if @review.save
    redirect_to [:admin, @review]
  else
    render "edit"
  end 
end
def destroy
    @review = Review.find_by_id(params[:id])
    @review.destroy
    redirect_to [:admin, :trips], notice: "レビューを削除しました。"
end
end
