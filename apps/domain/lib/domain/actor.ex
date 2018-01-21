defmodule Domain.Actor do
  alias __MODULE__

  @enforce_keys [:name]
  defstruct [:name]

  @doc """
  Create an Actor struct

  ## Examples

    iex> Actor.new "example"
    {:ok, %Actor{name: "example"}}
  """
  def new(name) when is_binary(name) do
    {:ok, %Actor{name: name}}
  end
end
