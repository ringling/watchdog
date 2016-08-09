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

  def handle_call({:all_switches}, _from, switches) do
    {:reply, switches, switches}
  end

  def handle_call({:initialize, switch}, _from, switches) do
    uuid = "UUID"

    switch = %DeadMansSwitch{switch | uuid: uuid}
    switches = Map.put(switches, switch.uuid, switch)
    {:reply, switch, switches}
  end

end
