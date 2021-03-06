defmodule Icook.Catalog.Recipe do
  use Ecto.Schema
  import Ecto.Changeset
  alias Icook.Catalog.Ingredient
  alias Icook.Catalog.RecipesIngredients

  schema "recipes" do
    field :title, :string
    field :description, :string
    field :image, :string
    field :label, :string

    many_to_many :ingredients, Ingredient,
      join_through: RecipesIngredients,
      on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:id, :title, :description, :image, :label])
    |> validate_required([:title, :image, :label])
    |> validate_length(:title, min: 3, max: 200)
    |> validate_length(:label, min: 3, max: 100)
    |> validate_length(:description, max: 1000)
    |> validate_length(:image, min: 3, max: 200)
    |> cast_assoc(:ingredients, with: &Ingredient.changeset/2)
  end
end
