defmodule PhoenixDdd.Model.User do
  defstruct [
    user_id: nil,
    name: nil,
    department: nil
  ]

  def create(%{:name => name, :department => department}) do
    case {name, department} do
      {"", _} -> nil
      {_, ""} -> nil
      {name, department} ->
        id = UUID.uuid1()
        %__MODULE__{user_id: id, name: name, department: department}
    end
  end
  def create(_), do: nil
end
