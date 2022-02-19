defmodule Icook.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :title, :string, size: 200, null: false
      add :image, :string, size: 200, null: false

      timestamps()
    end
  end
end
