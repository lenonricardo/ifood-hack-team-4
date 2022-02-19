defmodule Icook.Catalog.MarketsIngredients do
  use Ecto.Schema
  import Ecto.Changeset

  schema "markets_ingredients" do
    field :market_id, :id
    field :ingredient_id, :id

    timestamps()
  end

  @doc false
  def changeset(markets_ingredients, attrs) do
    markets_ingredients
    |> cast(attrs, [])
    |> validate_required([])
  end
end
