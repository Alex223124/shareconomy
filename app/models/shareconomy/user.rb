module Shareconomy
  class User < ActiveRecord::Base
    # Include default devise modules.
    devise :database_authenticatable, :registerable, :recoverable, :rememberable,
      :trackable, :validatable

    include DeviseTokenAuth::Concerns::User

    has_one :profile, dependent: :destroy
    has_many :sent_messages, class_name: Message.name, foreign_key: "sender_id"
    has_many :received_messages, class_name: Message.name, foreign_key: "recipient_id"
    has_many :sales, class_name: Order.name, foreign_key: 'seller_id'
    has_many :purchases, class_name: Order.name, foreign_key: 'buyer_id'

    after_create :create_profile

  end
end
