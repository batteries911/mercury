# frozen_string_literal: true

FactoryGirl.define do
  factory :profile do
    sequence(:name) { |n| "Profile #{n}" }
  end
end