defmodule Scheduler.Scheduler do
  use GenServer

  def init(state) do
    {:ok, state}
  end

  def handle_call(:view, _, state) do
    {:reply, state, state}
  end
end
