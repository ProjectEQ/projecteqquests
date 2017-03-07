function event_spawn(e)
  eq.set_timer('checkhate', 1000);
  local hate_list;
end

function event_timer(e)
  if (e.timer == 'checkhate') then
    hate_list = e.self:CountHateList();
    if (hate_list ~= nil and tonumber(hate_list) > 1) then
      eq.depop();
    end
  end
end
