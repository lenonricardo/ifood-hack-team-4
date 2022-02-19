defmodule Icook.Repo do
  use Ecto.Repo,
    otp_app: :icook,
    adapter: Ecto.Adapters.Postgres
end
