function event_combat(e)
if (e.joined == true) then
eq.set_timer("howl", 10 * 1000);
else
eq.stop_timer("howl");
end
end

function event_timer(e)
if (e.timer == "howl") then
eq.get_entity_list():GetNPCByNPCTypeID(303071):AddToHateList(e.other, 1);
eq.get_entity_list():GetNPCByNPCTypeID(303072):AddToHateList(e.other, 1);
e.self:Emote("howls for assistance!");
end
end
