defmodule RestAPIWeb.Type_userControllerTest do
  use RestAPIWeb.ConnCase

  alias RestAPI.Management
  alias RestAPI.Management.Type_user

  @create_attrs %{description: "some description"}
  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  def fixture(:type_user) do
    {:ok, type_user} = Management.create_type_user(@create_attrs)
    type_user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all type_user", %{conn: conn} do
      conn = get conn, type_user_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type_user" do
    test "renders type_user when data is valid", %{conn: conn} do
      conn = post conn, type_user_path(conn, :create), type_user: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, type_user_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, type_user_path(conn, :create), type_user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type_user" do
    setup [:create_type_user]

    test "renders type_user when data is valid", %{conn: conn, type_user: %Type_user{id: id} = type_user} do
      conn = put conn, type_user_path(conn, :update, type_user), type_user: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, type_user_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description"}
    end

    test "renders errors when data is invalid", %{conn: conn, type_user: type_user} do
      conn = put conn, type_user_path(conn, :update, type_user), type_user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type_user" do
    setup [:create_type_user]

    test "deletes chosen type_user", %{conn: conn, type_user: type_user} do
      conn = delete conn, type_user_path(conn, :delete, type_user)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, type_user_path(conn, :show, type_user)
      end
    end
  end

  defp create_type_user(_) do
    type_user = fixture(:type_user)
    {:ok, type_user: type_user}
  end
end
