FactoryBot.define do

  factory :item do
    name              {"パーカー"}
    price             {"2000"}
    size              {"M"}
    brand             {"ユニクロ"}
    status            {"1"}
    fee               {"1"}
    region            {"北海道"}
    shipping_date     {"1"}
    detail            {"かっちょいい"}
    prefecture_id     {"1"}
    user_id           {"1"}

  end

end