defmodule IcookWeb.MarketController do
  use IcookWeb, :controller

  alias Icook.Catalog
  alias Icook.Catalog.Market

  action_fallback IcookWeb.FallbackController

  @not_found_error {:error, :not_found}
  @invalid_value_error {:error, :unprocessable_entity}

  def index(conn, _params) do
    markets = Catalog.list_markets()
    render(conn, "index.json", markets: markets)
  end

  def create(conn, %{"market" => market_params}) do
    with {:ok, %Market{} = market} <- Catalog.create_market(market_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.market_path(conn, :show, market))
      |> render("show.json", market: market)
    end
  end

  def show(conn, %{"id" => id}) do
    market = Catalog.get_market!(id)
    render(conn, "show.json", market: market)
  rescue
    Ecto.NoResultsError -> @not_found_error
    Ecto.Query.CastError -> @invalid_value_error
  end

  def update(conn, %{"id" => id, "market" => market_params}) do
    market = Catalog.get_market!(id)

    with {:ok, %Market{} = market} <- Catalog.update_market(market, market_params) do
      render(conn, "show.json", market: market)
    end
  rescue
    Ecto.NoResultsError -> @not_found_error
    Ecto.Query.CastError -> @invalid_value_error
  end

  def delete(conn, %{"id" => id}) do
    market = Catalog.get_market!(id)

    with {:ok, %Market{}} <- Catalog.delete_market(market) do
      send_resp(conn, :no_content, "")
    end
  rescue
    Ecto.NoResultsError -> @not_found_error
    Ecto.Query.CastError -> @invalid_value_error
  end
end
