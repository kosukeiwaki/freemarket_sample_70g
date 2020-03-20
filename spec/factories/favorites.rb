FactoryBot.define do
  factory :favorite do
    item { "MyString" }
    references { "MyString" }
    user { nil }
  end
end
