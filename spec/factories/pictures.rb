FactoryBot.define do
  factory :picture do
    title                 {'タイトル'}
    explanation           {'説明文'}
    impression            {'感想'}


    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
