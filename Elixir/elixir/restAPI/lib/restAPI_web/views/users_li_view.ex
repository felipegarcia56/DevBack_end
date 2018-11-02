defmodule RestAPIWeb.Users_liView do
  use RestAPIWeb, :view
  alias RestAPIWeb.Users_liView

  def render("index.json", %{users_li: users_li}) do
    %{data: render_many(users_li, Users_liView, "users_li.json")}
  end

  def render("show.json", %{users_li: users_li}) do
    %{data: render_one(users_li, Users_liView, "users_li.json")}
  end

  def render("getInfo.json", %{users_li: users_li}) do
    %{data: render_one(users_li, Users_liView, "grl_info.json")}
  end

  def render("user.json", %{users_li: users_li}) do
    %{data: render_one(users_li, Users_liView, "user_inf.json")}
  end

  def render("users_li.json", %{users_li: users_li}) do
    %{
      id: users_li.id,
      last_name: users_li.last_name,
      full_name: users_li.full_name,
      identification: users_li.identification,
      type_user: users_li.type_user
    }
  end

  def render("grl_info.json", %{users_li: users_li}) do
    %{
      id: users_li.id,
      last_name: users_li.last_name,
      full_name: users_li.full_name,
      trademark: users_li.trademark,
      type_bw: users_li.type_bw,
      type_v: users_li.type_v,
      plate: users_li.plate
    }
  end

  def render("user_inf.json", %{users_li: users_li}) do
    %{
      id: users_li.id,
      last_name: users_li.last_name,
      full_name: users_li.full_name,
      identification: users_li.identification
    }
  end
end
