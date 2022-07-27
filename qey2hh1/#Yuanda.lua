-- BeginFile: qey2hh1\#Yuanda.pl
 -- Quest file for West Karana - Yuanda: Necromancer Epic 1.5 (pre)
-- items: 15809

 function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shhh, not so loud. I have heard stories of werewolves in this area..."); -- Text made up
	end
end

function event_trade(e)
	local item_lib = require("items");
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();

	if(item_lib.check_turn_in(e.trade, {item1 = 15809})) then -- Note to Yuanda
		e.self:Say("So you are working for Geboron? Yes I have seen the paladins and the staff they were guarding. They passed through here just one day ago. From what I have been told, they were attacked by a pack of werewolves. All of the paladins were killed and one of the werewolves took the staff. If you want the staff you will need to find these werewolves. Oh, no! Here they come now! I am getting out of here!");
		e.other:Ding();
		eq.spawn2(12183, 0, 0, xloc -18, yloc -35, zloc,   256); -- a snarling werewolf (normal)
		eq.spawn2(12183, 0, 0, xloc +18, yloc -35, zloc,   256); -- a snarling werewolf (normal)
		eq.spawn2(12183, 0, 0, xloc -35, yloc +10, zloc+5, 256); -- a snarling werewolf (normal)
		eq.spawn2(12183, 0, 0, xloc +35, yloc +10, zloc,   256); -- a snarling werewolf (normal)
		eq.spawn2(12184, 0, 0, xloc,    yloc +35, zloc,   256); -- a snarling werewolf (high)
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EndFile: qey2hh1\#Yuanda.lua (12188)
-- converted to lua by: robregen
