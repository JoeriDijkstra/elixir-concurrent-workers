defmodule StateServer.Server do
  use GenServer

  @default_state %{
    "workers" => 0,
    "max_workers" => 20
  }

  def start_link(_state) do
    GenServer.start_link(__MODULE__, @default_state, name: :state)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(:view, _, state) do
    {:reply, state, state}
  end

  def handle_call({:get, key}, _, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_cast({:set, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_cast(:reset, _) do
    {:noreply, @default_state}
  end
end
