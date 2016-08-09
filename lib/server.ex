defmodule DeadMansSwitch.Server do
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

  def activate(server, uuid) do

  end

  def deactivate(server, uuid) do

  end

  def remove(server, uuid) do

  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:all_switches}, _from, switches) do
    {:reply, switches, switches}
  end

  def handle_call({:initialize, switch}, _from, switches) do
    switch = %DeadMansSwitch{switch | uuid: "UUID"}
    switches = Map.put(switches, switch.uuid, switch)
    {:reply, switch, switches}
  end

end
