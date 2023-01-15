-- items: 62843, 62844, 62845
function event_say(e)
local qglobals = eq.get_qglobals(e.other)
	--e.self:Say("test " .. e.other:GetFaction(e.self));
	if(qglobals["druid_epic"] == "4" and e.other:GetFaction(e.self) < 5) then
		if( e.message:findi("hail")) then
			e.self:Say("What do you want? Were you not, what is it you are called, druid? Were you not druid I would rip your head from your torso. What you want had better be important.");
		elseif(e.message:findi("What about the Tribe of the Dawn?")) then
			e.self:Say("I am the tribe of the Dawn. I have been placed here for killing some beast that entered my territory. The creatures here say that I was unjust in doing so. I don't care about their justice or rules. It was where it did not belong. What do you want of me? I have something I must do soon.");	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other)
	if(qglobals["druid_epic"] == "4" and e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 62843}) ) then	
		e.self:Emote("looks at the paper you hand him. 'I can almost understand this writing. This is not a natural disease. I see that you understand the seed rituals, this is good.' The ursine waves his arms in a way that might indicate that he is casting a spell, though it looks little like the sort of spell casting you know. Two seeds appear in his hands. 'Good. I was not sure that I could grow these here. Take them. One is for your cause, one is for you.");
		e.other:SummonItem(62844); --Red Dogwood Seed
		e.other:SummonItem(62845); --Living Brambles See
		eq.set_timer("poof",6000);	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer=="poof") then
		eq.stop_timer("poof");
		e.self:Emote("growls loudly, 'I shall have my freedom!'"); 
		eq.depop_with_timer();
	end
end