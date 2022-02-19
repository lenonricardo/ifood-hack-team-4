defmodule Icook.Catalog.RecipesIngredients do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes_ingredients" do
    field :recipe_id, :id
    field :ingredient_id, :id

    timestamps()
  end

  @doc false
  def changeset(recipes_ingredients, attrs) do
    recipes_ingredients
    |> cast(attrs, [])
    |> validate_required([])
  end
end
