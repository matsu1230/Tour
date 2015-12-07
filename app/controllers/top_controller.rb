# coding: utf-8

class TopController < ApplicationController
  def index
    @see = Trip.where("category = ?", "海")
    @sky = Trip.where("category = ?", "空")
    @mnt = Trip.where("category = ?", "山")
    @pre = Trip.where("category = ?", "観光")
    @m = Trip.where("category = ?", "乗り物")
  end
end
