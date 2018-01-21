defmodule Domain.Feature do
  alias __MODULE__

  @enforce_keys [:name, :enabled, :actors, :groups]
  defstruct [:name, :enabled, :actors, :groups]

  @doc """
  Create a Feature struct

  ## Examples

    iex> Feature.new("example", false)
    {:ok, %Feature{name: "example", enabled: false, actors: MapSet.new, groups: MapSet.new}}

    iex> Feature.new("example")
    {:ok, %Feature{name: "example", enabled: true, actors: MapSet.new, groups: MapSet.new}}
  """
  def new(name, enabled \\ true) when is_binary(name) and is_boolean(enabled) do
    {:ok, %Feature{name: name, enabled: enabled, actors: MapSet.new(), groups: MapSet.new()}}
  end
end
