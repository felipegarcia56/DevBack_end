defmodule RestAPIWeb.Type_bodyworkView do
  use RestAPIWeb, :view
  alias RestAPIWeb.Type_bodyworkView

  def render("index.json", %{type_bodywork: type_bodywork}) do
    %{data: render_many(type_bodywork, Type_bodyworkView, "type_bodywork.json")}
  end

  def render("show.json", %{type_bodywork: type_bodywork}) do
    %{data: render_one(type_bodywork, Type_bodyworkView, "type_bodywork.json")}
  end

  def render("type_bodywork.json", %{type_bodywork: type_bodywork}) do
    %{id: type_bodywork.id,
      description: type_bodywork.description}
  end
end
