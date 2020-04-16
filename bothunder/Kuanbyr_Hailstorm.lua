function event_combat(e)
if (e.joined == true) then
eq.get_entity_list():GetNPCByNPCTypeID(209057):AddToHateList(e.other, 1);
eq.get_entity_list():GetNPCByNPCTypeID(209056):AddToHateList(e.other, 1);
eq.get_entity_list():GetNPCByNPCTypeID(209058):AddToHateList(e.other, 1);
end
end
