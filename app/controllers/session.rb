Desafio::App.controllers :session do

  get :index, :map => '/session/login' do
    render '/main/login.html'
  end

  set :protect_from_csrf, false
  get :auth, :map => '/auth/:provider/callback' do
    auth    = request.env["omniauth.auth"]
    account = Account.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
        Account.criar_com_omniauth(auth)
    set_current_account(account)
    redirect url(:main, :sales)
  end

  get :logout, :map => '/session/logout' do
    set_current_account(nil)
    redirect url(:session, :index)
  end

end
