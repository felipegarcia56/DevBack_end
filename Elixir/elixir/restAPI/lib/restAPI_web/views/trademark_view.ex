defmodule RestAPIWeb.TrademarkView do
  use RestAPIWeb, :view
  alias RestAPIWeb.TrademarkView

  def render("index.json", %{trademark: trademark}) do
    %{data: render_many(trademark, TrademarkView, "trademark.json")}
  end

  def render("show.json", %{trademark: trademark}) do
    %{data: render_one(trademark, TrademarkView, "trademark.json")}
  end

  def render("trademark.json", %{trademark: trademark}) do
    %{id: trademark.id,
      description: trademark.description}
  end
end
