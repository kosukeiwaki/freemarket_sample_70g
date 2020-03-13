FactoryBot.define do

  factory :item do
    name              {"パーカー"}
    price             {"2000"}
    size              {"M"}
    brand             {"ユニクロ"}
    status            {"未使用に近い"}
    fee               {"送料込み（出品者負担）"}
    region            {"北海道"}
    shipping_date     {"1~2日で発送"}
    detail            {"かっちょいい"}
    prefecture_id     {"1"}
    user_id           {"1"}

  end

end