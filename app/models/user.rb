class User < ActiveRecord::Base
  has_many :own_troubles, :foreign_key => :trouble_creator_id, :class_name => "Trouble"
  has_many :helping_troubles, :foreign_key => :trouble_solver_id, :class_name => "Trouble"

  def self.from_omniauth(auth_info)
    if user = find_by(uid: auth_info.extra.raw_info.id_str)
      user
    else
      create({uid: auth_info.extra.raw_info.id_str,
              name: auth_info.extra.raw_info.name,
              screenname: auth_info.extra.raw_info.screen_name,
              token: auth_info.token,
              secret: auth_info.secret})
    end
  end
end
