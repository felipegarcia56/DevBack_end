defmodule RestAPIWeb.Type_vehicleView do
  use RestAPIWeb, :view
  alias RestAPIWeb.Type_vehicleView

  def render("index.json", %{type_vehicle: type_vehicle}) do
    %{data: render_many(type_vehicle, Type_vehicleView, "type_vehicle.json")}
  end

  def render("show.json", %{type_vehicle: type_vehicle}) do
    %{data: render_one(type_vehicle, Type_vehicleView, "type_vehicle.json")}
  end

  def render("type_vehicle.json", %{type_vehicle: type_vehicle}) do
    %{id: type_vehicle.id,
      description: type_vehicle.description}
  end
end
