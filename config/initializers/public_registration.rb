class CanUserRegister
  def self.matches?(_)
    Flipper.enabled?(:public_registration)
  end
end
