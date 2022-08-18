class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_address = PurchaseRecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    binding.pry
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_code, :prefecture_id, :city, :number, :building_name, :phone_number).merge(token: params[:token], item_id: item.id, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_record_params[:@item_price],  # 商品の値段
      card: purchase_record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
