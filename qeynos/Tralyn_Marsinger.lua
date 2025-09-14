-- items: 18150, 18151, 18153, 18154
function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to my wife, Eve.",e.other:GetName()));
	end
	
end

function event_trade(e)

	if (eq.handin({[18150] = 1}) or eq.handin({[18151] = 1})) then
		local random_gold = math.random(6);
		e.self:Say("Incoming mail - very good! Please take this gold for your troubles.");
		e.other:Ding();
		e.other:Faction(284,5,0); -- Faction: League of Antonican Bards
		e.other:Faction(281,1,0); -- Faction: Knights of Truth
		e.other:Faction(262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(285,-1,0); -- Faction: Mayong Mistmoore
		e.other:AddEXP(1550);
		e.other:GiveCash(0,0,random_gold,0);
	elseif (eq.handin({[18153] = 1}) or eq.handin({[18154] = 1})) then
		local random_gold = math.random(12);
		e.self:Say("Incoming mail - very good! Please take this gold for your troubles.");
		e.other:Ding();
		e.other:Faction(284,5,0); -- Faction: League of Antonican Bards
		e.other:Faction(281,1,0); -- Faction: Knights of Truth
		e.other:Faction(262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(285,-1,0); -- Faction: Mayong Mistmoore
		e.other:AddEXP(1550);
		e.other:GiveCash(0,0,random_gold,0);
	end
	
end