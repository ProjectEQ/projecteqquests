function event_say(e)
	if(e.other:Class() == "Warrior") then
		if(e.message:findi("hail")) then
			e.self:Say("What do you need?  Be specific. I'm busy right now!");
		elseif(e.message:findi("hilt")) then
			e.self:Say("What is it you need to be knowing about hilts?  Do you need one made or [repaired]?");
		elseif(e.message:findi("repaired")) then
			e.self:Say("Well, tell me the name of the hilt you need repaired and I'll see what I can do.");
		elseif(e.message:findi("unjeweled dragon head hilt")) then
			e.self:Say("That just looks like it's missing some gems. I'm not quite sure what type of gems either but I can tell you two things about them just by the settings.  They were all different. and they all were very. very expensive. If I try to put the wrong kind of gems in these slots. it may be ruined forever.  I'll do whatever you want though. Just bring me the three gems you want me to try and put in the hilt.");
		elseif(e.message:findi("Severely Damaged Dragon Head Hilt")) then
			e.self:Say("Unfortunately, this hilt can only be reforged with the proper components. You might have a rough time finding the correct ore types needed for this hilt. I'll do whatever you want though. Just bring me the two components you want me to use to try and reforge this hilt with and I'll do it.");
		elseif(e.message:findi("golem")) then
			e.self:Say("That metal is used as the 'soul' of powerful magical constructions like golems. I do not know any place in this world where you could find a golem with a living center as powerful as this once was.");
		elseif(e.message:findi("rejesiam")) then
			e.self:Say("Rejesiam ore is from the lands of Kunark. The mountain giants in the frontier mountains control the only known mine of this great ore. They have built a vast fortress around the mine to protect it. The giants don't particularly like to trade with us smaller folks, but there is one old miner  named Mentrax Mountainbone who has traded with me in the past. Go find him and tell him Wenden sent you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20668,item2 = 10037,item3 = 10036,item4 = 10053})) then -- Unjeweled Dragon Head Hilt - Diamond - Black Sapphire - Jacinth
		e.self:Emote("begins to fiddle with the hilt, gently pressing the gems into place. It seems to take forever as you watch in silence. Wenden slowly places the last gem in place and gently bends the settings to hold the gems before he hands it back to you. 'That's a very impressive looking hilt there. The material it is made out of seems strangely familiar,' Wenden says as he turns back to his forge and his other work.");
		e.other:SummonItem(20671); -- Jeweled Dragon Head Hilt
		e.other:Ding();
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20669,item2 = 20666,item3 = 20677})) then -- Severely Damaged Dragon Head Hilt ID - Rejesiam Ore - Ball of Everliving Golem
		e.self:Emote("works his magic with his forge as you have never seen done quite like this. The bending and shaping to repair the hilt is only something a master of his art could even fathom to try. Once the hilt has been cooled in a near by bucket of ice cold water, he checks it for balance and resonance before handing it to you.");
		e.other:SummonItem(20672); -- Finely Crafted Dragon Head Hilt
		e.other:Ding();
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20669})) then
		e.self:Say("Where in the world did you drag that up?!' He peers closely at the severely damaged dragon head hilt. 'This metal is the same material that some mages use to make powerful golems and this other metal looks like rejesiam ore. If you can find some of those materials, I can fix this hilt up easily.");
		e.other:SummonItem(20669);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte  ID:10116 -- Wenden_Blackhammer
