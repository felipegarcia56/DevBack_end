defmodule RestAPIWeb.Vehicle_liControllerTest do
  use RestAPIWeb.ConnCase

  alias RestAPI.Management
  alias RestAPI.Management.Vehicle_li

  @create_attrs %{id_user: 42, plate: "some plate", trademark: 42, type_bodywork: 42, type_vehicle: 42}
  @update_attrs %{id_user: 43, plate: "some updated plate", trademark: 43, type_bodywork: 43, type_vehicle: 43}
  @invalid_attrs %{id_user: nil, plate: nil, trademark: nil, type_bodywork: nil, type_vehicle: nil}

  def fixture(:vehicle_li) do
    {:ok, vehicle_li} = Management.create_vehicle_li(@create_attrs)
    vehicle_li
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vehicle_li", %{conn: conn} do
      conn = get conn, vehicle_li_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vehicle_li" do
    test "renders vehicle_li when data is valid", %{conn: conn} do
      conn = post conn, vehicle_li_path(conn, :create), vehicle_li: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, vehicle_li_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "id_user" => 42,
        "plate" => "some plate",
        "trademark" => 42,
        "type_bodywork" => 42,
        "type_vehicle" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, vehicle_li_path(conn, :create), vehicle_li: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vehicle_li" do
    setup [:create_vehicle_li]

    test "renders vehicle_li when data is valid", %{conn: conn, vehicle_li: %Vehicle_li{id: id} = vehicle_li} do
      conn = put conn, vehicle_li_path(conn, :update, vehicle_li), vehicle_li: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, vehicle_li_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "id_user" => 43,
        "plate" => "some updated plate",
        "trademark" => 43,
        "type_bodywork" => 43,
        "type_vehicle" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, vehicle_li: vehicle_li} do
      conn = put conn, vehicle_li_path(conn, :update, vehicle_li), vehicle_li: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vehicle_li" do
    setup [:create_vehicle_li]

    test "deletes chosen vehicle_li", %{conn: conn, vehicle_li: vehicle_li} do
      conn = delete conn, vehicle_li_path(conn, :delete, vehicle_li)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, vehicle_li_path(conn, :show, vehicle_li)
      end
    end
  end

  defp create_vehicle_li(_) do
    vehicle_li = fixture(:vehicle_li)
    {:ok, vehicle_li: vehicle_li}
  end
end
