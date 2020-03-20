class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, :email, :password, :firstname,:lastname, :lastname_kana, :firstname_kana, :birthday, presence: { message: 'が入力されていません' }
  validates :email, format: {
    with:  /\A\S+@\S+\.\S+\z/, message: "メールアドレスが正しくありません"
  }
  validates :lastname, :firstname, format: {
    with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角で入力してください"
  }
  validates :lastname_kana, :firstname_kana, format: {
    with: /\A[ぁ-んー－]+\z/, message: "全角ひらがなで入力してください"
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :sns_credentials

  has_one :address

  accepts_nested_attributes_for :address


  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  has_many :items
  has_many :favorites, dependent: :destroy
  has_many :favorited_items, through: :favorites, source: :item
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
end