module User::Auth

  extend ActiveSuport::Consern

  attr_reader :password
  attr_writer :password_confirmation

  include do
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true
    validates :age, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
  end

  def auth(pass_string)
    digest(pass_string) == self.password_digest ? self : false
  end

  def password=(pass_string)
    if pass_string.nil?
      self.password_digest = nil
    elsif pass_string.present?
      @password = pass_string
      self.password_digest = digest(pass_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end