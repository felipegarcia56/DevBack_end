defmodule RestAPIWeb.Type_userView do
  use RestAPIWeb, :view
  alias RestAPIWeb.Type_userView

  def render("index.json", %{type_user: type_user}) do
    %{data: render_many(type_user, Type_userView, "type_user.json")}
  end

  def render("show.json", %{type_user: type_user}) do
    %{data: render_one(type_user, Type_userView, "type_user.json")}
  end

  def render("type_user.json", %{type_user: type_user}) do
    %{id: type_user.id,
      description: type_user.description}
  end
end
