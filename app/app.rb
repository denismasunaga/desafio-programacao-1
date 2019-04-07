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
      provider :facebook, 'app_id', 'app_secret', provider_ignores_state: true
    end
  end
end
