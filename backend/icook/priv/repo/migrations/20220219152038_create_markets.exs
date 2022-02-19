defmodule Icook.Repo.Migrations.CreateMarkets do
  use Ecto.Migration

  def change do
    create table(:markets) do
      add :name, :string, size: 200, null: false
      add :logo, :string, size: 200, null: false

      timestamps()
    end
  end
end
