# coding: utf-8

class MembersController < ApplicationController
  # 会員一覧
  def index
    @members = Member.order("id")
  end

  # 会員情報の詳細
  def show
  @member = @current_member
  @reservation = Reservation.joins(:detail).where("member_id = ?",@member.id)
  @trip = Trip.all
  @review = Review.where("member_id = ?", @member.id)
  end

  # 新規作成フォーム
  def new
    @member = Member.new
  end

  # 更新フォーム
  def edit
    @member = Member.find(params[:id])
  end

  # 会員の新規登録
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to :session, notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  # 会員情報の更新
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to @member, notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  # 会員の削除
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "会員を削除しました。"
  end
end
