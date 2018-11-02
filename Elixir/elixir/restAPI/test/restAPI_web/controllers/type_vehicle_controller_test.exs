defmodule RestAPIWeb.Type_vehicleControllerTest do
  use RestAPIWeb.ConnCase

  alias RestAPI.Management
  alias RestAPI.Management.Type_vehicle

  @create_attrs %{description: "some description"}
  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  def fixture(:type_vehicle) do
    {:ok, type_vehicle} = Management.create_type_vehicle(@create_attrs)
    type_vehicle
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all type_vehicle", %{conn: conn} do
      conn = get conn, type_vehicle_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type_vehicle" do
    test "renders type_vehicle when data is valid", %{conn: conn} do
      conn = post conn, type_vehicle_path(conn, :create), type_vehicle: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, type_vehicle_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, type_vehicle_path(conn, :create), type_vehicle: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type_vehicle" do
    setup [:create_type_vehicle]

    test "renders type_vehicle when data is valid", %{conn: conn, type_vehicle: %Type_vehicle{id: id} = type_vehicle} do
      conn = put conn, type_vehicle_path(conn, :update, type_vehicle), type_vehicle: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, type_vehicle_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description"}
    end

    test "renders errors when data is invalid", %{conn: conn, type_vehicle: type_vehicle} do
      conn = put conn, type_vehicle_path(conn, :update, type_vehicle), type_vehicle: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type_vehicle" do
    setup [:create_type_vehicle]

    test "deletes chosen type_vehicle", %{conn: conn, type_vehicle: type_vehicle} do
      conn = delete conn, type_vehicle_path(conn, :delete, type_vehicle)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, type_vehicle_path(conn, :show, type_vehicle)
      end
    end
  end

  defp create_type_vehicle(_) do
    type_vehicle = fixture(:type_vehicle)
    {:ok, type_vehicle: type_vehicle}
  end
end
