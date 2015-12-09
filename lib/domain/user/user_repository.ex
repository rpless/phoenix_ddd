defmodule PhoenixDdd.Repository.User do
  alias PhoenixDdd.Persistence
  import Ecto.Query

  def get(user_id) when is_binary(user_id) do
    query = from u in PhoenixDdd.Persistence.User,
      where: u.user_id == ^user_id
    case query |> Persistence.one do
      nil -> nil
      model -> model |> to_domain_model
    end
  end

  defp to_domain_model(persistence_model) do
    %PhoenixDdd.User{
      user_id: persistence_model.user_id,
      name: persistence_model.name,
      department: persistence_model.department
    }
  end
end
