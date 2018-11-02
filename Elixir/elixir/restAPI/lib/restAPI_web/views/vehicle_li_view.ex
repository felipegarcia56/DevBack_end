defmodule RestAPIWeb.Vehicle_liView do
  use RestAPIWeb, :view
  alias RestAPIWeb.Vehicle_liView

  def render("index.json", %{vehicle_li: vehicle_li}) do
    %{data: render_many(vehicle_li, Vehicle_liView, "vehicle_li.json")}
  end

  def render("show.json", %{vehicle_li: vehicle_li}) do
    %{data: render_one(vehicle_li, Vehicle_liView, "vehicle_li.json")}
  end

  def render("vehicle_li.json", %{vehicle_li: vehicle_li}) do
    %{id: vehicle_li.id,
      plate: vehicle_li.plate,
      type_vehicle: vehicle_li.type_vehicle,
      type_bodywork: vehicle_li.type_bodywork,
      trademark: vehicle_li.trademark,
      id_user: vehicle_li.id_user}
  end
end
