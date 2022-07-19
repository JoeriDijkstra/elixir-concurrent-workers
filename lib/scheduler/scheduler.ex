defmodule Scheduler.Scheduler do
  use GenServer

  alias Scheduler.ServerFunctions

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :scheduler)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(:view, _, state) do
    {:reply, state, state}
  end

  def handle_call(:execute, _, state) do
    {worker_state, new_state} = ServerFunctions.update_state(state)
    ServerFunctions.build_worker(state)


    {:reply, worker_state, new_state}
  end

  def handle_cast({:add, job_state}, state) do
    {:noreply, [job_state | state]}
  end
end
