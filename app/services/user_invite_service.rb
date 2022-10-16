module UserInviteService
  # @param name [String]
  # @param email [String]
  # @param roles [Array<Symbol>]
  # @param resource [ApplicationRecord]
  # @return [User]
  def self.invite(email:, name: nil, roles: [], resource: nil)
    User.invite!(email: email) do |user|
      user.name = name if name
      roles.each do |role|
        user.add_role(role, resource)
      end
    end
  end
end