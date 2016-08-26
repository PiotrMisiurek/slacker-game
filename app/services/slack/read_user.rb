class Slack::ReadUser

  def self.call(uid, api)
    new(uid, api).call
  end

  def initialize(uid, api)
    @uid = uid
    @api = api
  end

  def call
    api.users_info(user: uid)["user"]
  end

  private

  attr_reader :uid, :api
end
