defmodule Icook.Catalog.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ingredients" do
    field :image, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:id, :title, :image])
    |> validate_required([:title, :image])
    |> validate_length(:title, min: 3, max: 200)
    |> validate_length(:image, min: 3, max: 200)
  end
end
