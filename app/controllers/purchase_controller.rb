class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_card

  def index
    @item = Item.find(params[:id])
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
    Payjp::Charge.create(
    :amount => @item.price, 
    :customer => @card.customer_id, 
    :currency => 'jpy', 
  )
  @item_buyer= Item.find(params[:id])
  @item_buyer.update(buyer_id: current_user.id)
  redirect_to action: 'done' 
  end
end

private

def set_card
  @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
end