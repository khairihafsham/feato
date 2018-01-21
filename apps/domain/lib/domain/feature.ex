defmodule Domain.Feature do
  alias __MODULE__
  alias Domain.Actor

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

  @doc """
  Add an %Actor{} into %Feature{}

  ## Examples

    iex> {:ok, feature} = Feature.new("example")
    iex> {:ok, actor_a} = Actor.new("a")
    iex> {:ok, actor_b} = Actor.new("b")
    iex> {:ok, feature} = Feature.add_actor(feature, actor_a)
    {:ok,
     %Feature{name: "example", enabled: true,
       actors: MapSet.new([%Actor{name: "a"}]),
       groups: MapSet.new([])}
    }
    iex> Feature.add_actor(feature, actor_b)
    {:ok,
     %Feature{name: "example", enabled: true,
       actors: MapSet.new([%Actor{name: "a"}, %Actor{name: "b"}]),
       groups: MapSet.new([])}
    }
  """
  def add_actor(%Feature{} = feature, %Actor{} = actor) do
    {:ok, update_in(feature.actors, &MapSet.put(&1, actor))}
  end
end
