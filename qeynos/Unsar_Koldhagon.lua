-- items: 13071, 13070, 13068
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, %s, I am Unsar, student of Mespha. I am working on a spell. . . I call it [Unsar's Glory]. Great name, huh?",e.other:GetName()));
	elseif(e.message:findi("unsar's glory")) then
		e.self:Say("Ah, Unsar's Glory. . . Mind you, I haven't perfected it yet, but bring me some [rat whiskers], [snake scales], and two [bat wings], and I'll show you how it works.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13071,item2 = 13070,item3 = 13068,item4 = 13068})) then
		e.self:Say("All right, check this out. . . Maybe one day you'll be good enough to do this, too");
		e.other:Ding();
		e.other:Faction(342,5,0); -- Faction: Order of Three
		e.other:Faction(221,-5,0); -- Faction: Bloodsabers
		e.other:Faction(262,5,0); -- Faction: Guards of Qeynos
		e.other:Faction(296,-5,0); -- Faction: Opal Darkbriar
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
