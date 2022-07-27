local dz_switches = {
  [5] = { zone="thundercrest" }, -- entrance used by different versions
}

-- todo: this sucks, dark reign side will have different task ids too
local switch_task_ids = {
  [5] = {
    4778, 4779, 4780, -- Simple Task
    4803, 4804, 4805, -- Throes of Contagion
    4796, 4797, 4798, -- Scions of Thundercrest
    4800, 4801, 4802, -- Splitting the Storm
    4772, 4773, 4774, -- Holy Hour
    4793, 4794, 4795, -- The Creator
    4775, 4776, 4777, -- Lair Unguarded
    4806, 4807, 4808, -- Behind Closed Doors
    5068, 5069, 5070  -- House of the Autumn Rose
  }
}

function event_click_door(e)
  local door_id = e.door:GetDoorID()
  eq.debug("Door: " .. door_id)

  -- todo: this should maybe be handled by source with a global switch id (multiple tasks use this objective)
  local task_switch = switch_task_ids[door_id]
  if task_switch then
    local task_element_index = 0 -- touching the switch is the first task element index for all the tasks
    for _,task_id in pairs(task_switch) do
      if eq.is_task_activity_active(task_id, task_element_index) then
        eq.debug(("Updating active task for task %d"):format(task_id))
        eq.update_task_activity(task_id, task_element_index, 1)
        break
      end
    end
  end

  local dz = dz_switches[door_id]
  if dz then
    e.self:MovePCDynamicZone(dz.zone, -1, false) -- todo: make msg_if_invalid false by default
  end
end
