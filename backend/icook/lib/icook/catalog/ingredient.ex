defmodule Icook.Catalog.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset
  alias Icook.Catalog.Market
  alias Icook.Catalog.MarketsIngredients

  schema "ingredients" do
    field :image, :string
    field :title, :string
    field :price, :float

    many_to_many :markets, Market,
      join_through: MarketsIngredients,
      on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:id, :title, :image, :price])
    |> validate_required([:title, :image, :price])
    |> validate_length(:title, min: 3, max: 200)
    |> validate_length(:image, min: 3, max: 200)
    |> cast_assoc(:markets, with: &Market.changeset/2)
  end
end
