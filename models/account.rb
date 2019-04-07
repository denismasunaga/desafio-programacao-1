class Account < ActiveRecord::Base

  validates_presence_of :name, :role, :provider, :uid
  validates_format_of       :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Email inválido!"

  def self.criar_com_omniauth(auth)
    begin
      create! do |account|
        account.provider = auth["provider"]
        account.uid      = auth["uid"]
        account.name    = auth["info"]["name"] if auth["info"]
        account.email    = auth["info"]["email"] if auth["info"]
        account.role     = "users"
      end
    rescue StandardError => e
      raise 'Algum(ns) dos campo(s) fornecido(s) está(ão) vazio(s).'
    end

  end

end
