
function event_enter_zone(e)
	eq.set_timer("spires", 10 * 1000);
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);

	if qglobals.nexus_tox ~= nil and qglobals.spire_tox ~= nil and qglobals.spire_tox == "1" and e.self:HasItem(19720) then
		eq.SelfCast(2433); -- self only to avoid AE
		eq.set_global("spire_tox","0",1,"F");
		eq.del_global("message_tox");
		e.self:NukeItem(19720) -- removes stone from inventory.
	elseif qglobals.nexus_tox ~= nil and qglobals.spire_tox ~= nil and qglobals.spire_tox == "1" and qglobals.message_tox == nil and not e.self:HasItem(19720) then
		e.self:Message(MT.Yellow, "You don't have the correct component to travel to Luclin.");
		eq.set_global("message_tox","1",1,"M20"); -- prevent component mssage from being spammed.
	end
end

function event_signal(e)
	if e.signal == "666" then
		e.self:UpdateTaskActivity(3539,1,1);
	elseif e.signal == "667" then
		local group_list = e.self:CastToClient():GetGroup(); -- Get Group
		for i = 0, group_list:GroupCount() - 1 do -- Loop Through Group Members
			local player = other_group:GetMember(i); -- Pull player entity id

			player:FailTask(3539);
			e.self:NukeItem(80038);
		end
	end
end