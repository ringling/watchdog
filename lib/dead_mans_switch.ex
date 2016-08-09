defmodule DeadMansSwitch do
  defstruct app_name: nil, uuid: nil, active: false, timeout_seconds: 60, timer: nil

end
