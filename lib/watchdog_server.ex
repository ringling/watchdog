defmodule Watchdog.Server do
  use GenServer

  ## Client API

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  def initialize(server, %DeadMansSwitch{}=switch) do
    GenServer.call(server, {:initialize, switch})
  end

  def all_switches(server) do
    GenServer.call(server, {:all_switches})
  end

  def reset_timer(server, uuid) do
    GenServer.call(server, {:reset_timer, uuid})
  end

  def activate(server, uuid) do
    # START TIMER
    # SET ACTIVE TRUE
    # SET PINGED FALSE
  end

  def deactivate(server, uuid) do
    # SET TIMER NIL
    # SET ACTIVE FALSE
  end

  def remove(server, uuid) do
    # REMOVE SWITCH
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_info({:timer, uuid}, switches) do
    IO.inspect "Timer was here #{uuid}"
    switch = fetch_switch(uuid, switches)
    ref = Process.send_after(self(), {:timer, switch.uuid}, switch.timeout_seconds * 1000)
    {:noreply, Map.put(switches, uuid, %DeadMansSwitch{switch | timer: ref})}
  end

  def handle_call({:all_switches}, _from, switches) do
    {:reply, switches, switches}
  end

  def handle_call({:initialize, switch}, _from, switches) do
    switch = %DeadMansSwitch{switch | uuid: UUID.uuid1()}
      |> start_timer
    switches = Map.put(switches, switch.uuid, switch)
    {:reply, switch, switches}
  end

  defp fetch_switch(uuid, switches) do
    switches |> Map.get(uuid)
  end

  defp start_timer(%DeadMansSwitch{}=switch) do
    server_pid = self()
    ref = Process.send_after(server_pid, {:timer, switch.uuid}, 5000)
    %DeadMansSwitch{switch | timer: ref}
  end

end
