class User < ApplicationRecord
  has_secure_password
  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: {minimum: 3, maximum: 20}
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_save :capitalize_attributes

  has_many :likes
  has_many :posts

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  private
    def capitalize_attributes
      titlecasable = ["first_name","last_name"]
      self.attributes.each do |attr,val|
        self.send("#{attr}=",val.strip.titlecase) if titlecasable.include?(attr) && !val.nil?
        self.send("#{attr}=",val.to_s.strip.titlecase) if titlecasable.include?(attr)
      end
    end
end
