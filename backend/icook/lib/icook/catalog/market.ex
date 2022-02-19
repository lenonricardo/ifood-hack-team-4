defmodule Icook.Catalog.Market do
  use Ecto.Schema
  import Ecto.Changeset

  schema "markets" do
    field :logo, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(market, attrs) do
    market
    |> cast(attrs, [:id, :name, :logo])
    |> validate_required([:name, :logo])
    |> validate_length(:name, min: 3, max: 200)
    |> validate_length(:logo, min: 3, max: 200)
  end
end
