FactoryBot.define do
  factory :user do
    name                  {"sampleuser"}
    email                 {Faker::Internet.free_email}
    password              {"0000aaa"}
    password_confirmation {password}
    favorite              {"ゴッホ"}
    museum                {"オルセー"}
  end
end
