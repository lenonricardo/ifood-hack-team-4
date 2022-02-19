defmodule Icook.Repo.Migrations.CreateMarketsIngredients do
  use Ecto.Migration

  def change do
    create table(:markets_ingredients) do
      add :market_id, references(:markets, on_delete: :nothing), null: false
      add :ingredient_id, references(:ingredients, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:markets_ingredients, [:market_id])
    create index(:markets_ingredients, [:ingredient_id])
  end
end
