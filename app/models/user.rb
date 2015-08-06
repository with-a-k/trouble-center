class User < ActiveRecord::Base
  # need to distinguish a trouble's creator from the user that accepts it
  has_many :troubles

  def self.from_omniauth(auth_info)
    if user = find_by(uid: auth_info.extra.raw_info.id_str)
      user
    else
      create({uid: auth_info.extra.raw_info.id_str,
              name: auth_info.extra.raw_info.name,
              screenname: auth_info.extra.raw_info.screen_name,
              token: auth_info.extra.raw_info.credentials.token,
              secret: auth_info.extra.raw_info.credentials.secret})
    end
  end
end
