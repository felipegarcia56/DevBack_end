defmodule RestAPIWeb.Type_bodyworkControllerTest do
  use RestAPIWeb.ConnCase

  alias RestAPI.Management
  alias RestAPI.Management.Type_bodywork

  @create_attrs %{description: "some description"}
  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  def fixture(:type_bodywork) do
    {:ok, type_bodywork} = Management.create_type_bodywork(@create_attrs)
    type_bodywork
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all type_bodywork", %{conn: conn} do
      conn = get conn, type_bodywork_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type_bodywork" do
    test "renders type_bodywork when data is valid", %{conn: conn} do
      conn = post conn, type_bodywork_path(conn, :create), type_bodywork: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, type_bodywork_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, type_bodywork_path(conn, :create), type_bodywork: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type_bodywork" do
    setup [:create_type_bodywork]

    test "renders type_bodywork when data is valid", %{conn: conn, type_bodywork: %Type_bodywork{id: id} = type_bodywork} do
      conn = put conn, type_bodywork_path(conn, :update, type_bodywork), type_bodywork: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, type_bodywork_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description"}
    end

    test "renders errors when data is invalid", %{conn: conn, type_bodywork: type_bodywork} do
      conn = put conn, type_bodywork_path(conn, :update, type_bodywork), type_bodywork: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type_bodywork" do
    setup [:create_type_bodywork]

    test "deletes chosen type_bodywork", %{conn: conn, type_bodywork: type_bodywork} do
      conn = delete conn, type_bodywork_path(conn, :delete, type_bodywork)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, type_bodywork_path(conn, :show, type_bodywork)
      end
    end
  end

  defp create_type_bodywork(_) do
    type_bodywork = fixture(:type_bodywork)
    {:ok, type_bodywork: type_bodywork}
  end
end
