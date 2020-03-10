FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    lastname              {"新田"}
    firstname             {"仁志"}
    lastname_kana         {"にった"}
    firstname_kana        {"ひとし"}
    birthday              {"2020-03-07"}
  end

end