class Item < ApplicationRecord
  
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :category, optional: true

    validates :name, :price, :status, :fee, :prefecture_id, :shipping_date, :detail, presence: { message: 'が入力されていません' }
    validates :price,  numericality: { only_integer: true ,message: '整数の数字を入力してください'}
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images, allow_destroy: true
    validates :images, presence: { message: '画像を選択してください' }
    validates :category, presence: { message: 'カテゴリーを選択してください' }
    # validates_associated :category

    # validates :price, format{
       # with: /\A\z/, message: "300円以上にしてください"
    # }
    validates :price, length: {maximum: 8, message:'9.999.999円以下にしてください'}

    enum status:{
      新品、未使用: 0,
      未使用に近い: 1,
      目立った傷や汚れなし: 2,
      やや傷や汚れあり: 3,
      傷や汚れあり: 4,
      全体的に状態が悪い: 5
    }
    enum fee:{
      送料込み（出品者負担）: 0,
      着払い（購入者負担）: 1
    }
    enum shipping_date:{
      "1~2日で発送": 0,
      "2~3日で発送": 1,
      "4~7日で発送": 2
    }
    enum stock:{
      出品中: 0,
      売却済: 1
    }
end