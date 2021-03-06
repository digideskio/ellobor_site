Rails.application.routes.draw do

  mount Lockup::Engine, at: "/lockup" if Rails.env.production?

  ## set a little insider variable, or clear it
  if Rails.env.development?
    get "application/set_development_mode_session_var", to: "application#set_development_mode_session_var"
    get "application/unset_development_mode_session_var", to: "application#unset_development_mode_session_var"
  end

  get    "pages/load-signatories",         to: "pages#load_signatories",        as: :load_signatories
  post   "sign/new",                       to: "sign#new",                      as: :create_signatory
  get    "sign/verify/:token",             to: "sign#verify",                   as: :verify_signatory
  get    "unsubscribe/:token",             to: "sign#unsubscribe",              as: :unsubscribe_email

  # error pages
  get "/404", to: "errors#not_found_404"
  get "/500", to: "errors#internal_error_500"
  get "/422", to: "errors#unprocessable_entity_422"

  root to: "pages#index"

end
