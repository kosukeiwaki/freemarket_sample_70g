class CardController < ApplicationController

  require "payjp"
  before_action :set_card

  def new
    card = Card.new
  end

  def pay 
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      email: current_user.email, 
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
        flash[:success] = '登録に成功しました'
      else
        redirect_to action: "pay"
        flash[:alart] = '登録に失敗しました'
      end
    end
  end

  def delete 
    if @card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "new"
      flash[:success] = '登録を削除しました'
  end

  def show 
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
end

private

def set_card
  @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
end
