class User < ApplicationRecord
  def self.create_with_oauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.oauth_token = auth['credentials']['token']
      raw_info = auth['extra']['raw_info']
      user.name = raw_info['login']
    end
  end
end
