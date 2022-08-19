class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :ensure_user_3, only: [:index]

  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
  @item = Item.find(params[:item_id])
  end

  def ensure_user_3
    if current_user.id != @item.user_id && @item.purchase_record.present?
      redirect_to root_path
    end
  end

end
