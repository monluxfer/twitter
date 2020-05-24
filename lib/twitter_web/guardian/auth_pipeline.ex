defmodule Twitter.Guardian.AuthPipeline do
    use Guardian.Plug.Pipeline, otp_app: :Twitter,
    module: Twitter.Guardian,
    error_handler: Twitter.AuthErrorHandler

    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
end
