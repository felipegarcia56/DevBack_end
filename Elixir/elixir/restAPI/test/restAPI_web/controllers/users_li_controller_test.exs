defmodule RestAPIWeb.Users_liControllerTest do
  use RestAPIWeb.ConnCase

  alias RestAPI.Management
  alias RestAPI.Management.Users_li

  @create_attrs %{full_name: "some full_name", identification: "some identification", last_name: "some last_name", type_user: 42}
  @update_attrs %{full_name: "some updated full_name", identification: "some updated identification", last_name: "some updated last_name", type_user: 43}
  @invalid_attrs %{full_name: nil, identification: nil, last_name: nil, type_user: nil}

  def fixture(:users_li) do
    {:ok, users_li} = Management.create_users_li(@create_attrs)
    users_li
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users_li", %{conn: conn} do
      conn = get conn, users_li_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create users_li" do
    test "renders users_li when data is valid", %{conn: conn} do
      conn = post conn, users_li_path(conn, :create), users_li: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, users_li_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "full_name" => "some full_name",
        "identification" => "some identification",
        "last_name" => "some last_name",
        "type_user" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, users_li_path(conn, :create), users_li: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update users_li" do
    setup [:create_users_li]

    test "renders users_li when data is valid", %{conn: conn, users_li: %Users_li{id: id} = users_li} do
      conn = put conn, users_li_path(conn, :update, users_li), users_li: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, users_li_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "full_name" => "some updated full_name",
        "identification" => "some updated identification",
        "last_name" => "some updated last_name",
        "type_user" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, users_li: users_li} do
      conn = put conn, users_li_path(conn, :update, users_li), users_li: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete users_li" do
    setup [:create_users_li]

    test "deletes chosen users_li", %{conn: conn, users_li: users_li} do
      conn = delete conn, users_li_path(conn, :delete, users_li)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, users_li_path(conn, :show, users_li)
      end
    end
  end

  defp create_users_li(_) do
    users_li = fixture(:users_li)
    {:ok, users_li: users_li}
  end
end
