FactoryBot.define do
  factory :school, class: School do
    name { "DevPoint" }
    address {"123 main st."}
    principal { "Bob" }
    capacity { 250 }
    private_school { true }
  end
end