module Desafio
  class App < Padrino::Application
    use ConnectionPoolManagement
    register Padrino::Mailer
    register Padrino::Helpers
    enable :sessions

    register Padrino::Admin::AccessControl

    set :login_page, "/session/login" # determines the url login occurs

    access_control.roles_for :any do |role|
      role.protect "/"
      role.allow "/session/login"
      role.allow "/session/logout"
      role.allow "/auth"
    end

# now we add a role for users
    access_control.roles_for :users do |role|
      role.allow "/sales"
    end

    use OmniAuth::Builder do
      provider :facebook, '655402758237739', '111f0a873cdd522ee593be710090b49e', provider_ignores_state: true
    end
  end
end
