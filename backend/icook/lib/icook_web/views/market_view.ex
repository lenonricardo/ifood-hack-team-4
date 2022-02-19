defmodule IcookWeb.MarketView do
  use IcookWeb, :view
  alias IcookWeb.MarketView

  def render("index.json", %{markets: markets}) do
    %{data: render_many(markets, MarketView, "market.json")}
  end

  def render("show.json", %{market: market}) do
    %{data: render_one(market, MarketView, "market.json")}
  end

  def render("market.json", %{market: market}) do
    %{
      id: market.id,
      name: market.name,
      logo: market.logo
    }
  end
end
