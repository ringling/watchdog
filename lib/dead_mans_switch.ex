defmodule DeadMansSwitch do
  defstruct app_name: nil, uuid: nil, active: false, timeout_seconds: 5, timer: nil

end
