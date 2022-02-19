defmodule Icook.Repo.Migrations.CreateRecipesIngredients do
  use Ecto.Migration

  def change do
    create table(:recipes_ingredients) do
      add :recipe_id, references(:recipes, on_delete: :nothing), null: false
      add :ingredient_id, references(:ingredients, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:recipes_ingredients, [:recipe_id])
    create index(:recipes_ingredients, [:ingredient_id])
  end
end
