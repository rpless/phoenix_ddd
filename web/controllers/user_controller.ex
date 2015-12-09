defmodule PhoenixDdd.UserController do
  use PhoenixDdd.Web, :controller

  def get_user(conn, %{"user_id" => user_id}) do
    case user_id |> PhoenixDdd.Repository.User.get do
      nil -> conn |> send_resp(:not_found, "")
      %PhoenixDdd.Model.User{name: name, department: department} ->
        data = %{"name" => name, "department" => department}
        conn |> json(data)
    end
  end
end
