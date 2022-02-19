defmodule Icook.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string, size: 200, null: false
      add :description, :string, size: 1000
      add :image, :string, null: false
      add :label, :string, size: 100, null: false

      timestamps()
    end
  end
end
