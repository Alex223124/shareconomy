Shareconomy::Engine.routes.draw do
  apipie
  mount_devise_token_auth_for Shareconomy::User.name,
                                at: 'api/v1/auth',
                                controllers: {
                                  registrations: 'shareconomy/api/v1/auth/registrations'
                                }
end
