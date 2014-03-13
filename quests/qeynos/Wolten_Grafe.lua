function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, noble " .. e.other:GetName() .. ". Remember to spread the words of Karana throughout the faraway lands on which you shall tread. We of the Temple of Thunder are looking for new members - good people who [wish to join our cause]. Let the call go out!");
	elseif(e.message:findi("join the cause")) then
		e.self:Say("That IS good news! If you walk the righteous path of the Rainkeeper, Karana, then you are truly noble. I have need of someone like that. I must find someone to perform a [dangerous mission] or perhaps you would rather seek out the [Rat King] or [crush the undead].");
	elseif(e.message:findi("crush the undead")) then
		e.self:Say("Those who passed generations ago have had their bones exhumed and enchanted. Some evil force plagues this land with these evil skeletons. You will fight for us and crush the skeletons. Take this box and fill it with the bones of those creatures. We will not allow them to rise again and you shall earn our respect. Go forth and fight for Karana!");
		e.other:SummonItem(17941); -- Box for bones
	elseif(e.message:findi("dangerous mission")) then
		e.self:Say("You must go into the catacombs and find a man named Drosco Finlayer. Pass him this note. He has been deep undercover in the Shrine of Bertoxxulous and will have directions to that vile place. To do this will surely show your allegiance to this temple.");
		e.other:SummonItem(18804);
	elseif(e.message:findi("rat king")) then
		e.self:Say("You may try, but no one has truly seen him.  I would look in the sewers.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Say("Your Excellency, we need to recruit a newcomer to find and infiltrate the Shrine of Bertoxxulous. The Shrine's eyes are watching all our moves.");
		eq.signal(1128,1);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13882})) then -- A box of bones
		e.self:Say("You have done well. Let it be known to all that you fight for the Rainkeeper. Go and continue the battle.");
		e.other:SummonItem(13006);
		e.other:Ding();
		e.other:Faction(183,5,0); -- Knights of Thunder
		e.other:Faction(257,5,0); -- Preists of Life
		e.other:Faction(135,5,0); -- Guards of Qeynos
		e.other:Faction(21,-7,0); -- Bloodsabers
		e.other:AddEXP(100);
		e.other:GiveCash(5,2,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18805})) then
		e.self:Say("This is terrible news. It is good you did not find your grave in the catacombs. You completed your mission regardless of the odds of survival. The temple thanks you. We shall still require your service, Knight of Thunder. Events have transpired which put all agents of righteousness in danger. We cannot explain all as yet. Take this note to Freeport. You will give it to Eestyana Naestra at the Hall of Truth. Beware, now. The Shrine of Bertoxxulous now knows of your allegiance. Give me any other item.");
		e.other:SummonItem(6537);
		e.other:Ding();
		e.other:Faction(183,1,0); -- Knights of Thunder
		e.other:Faction(257,1,0); -- Preists of Life
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(21,-1,0); -- Bloodsabers
		e.other:AddEXP(500);
		e.other:GiveCash(0,0,8,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13396})) then -- Rat Kings Head
		e.self:Say("So it is true, he does... or did, exist.  Well done $name, take this for your trouble.");
		e.other:SummonItem(eq.ChooseRandom(2112, 2106, 2111, 2104, 2108));
		e.other:Ding();
		e.other:Faction(183,5,0); -- Knights of Thunder
		e.other:Faction(257,5,0); -- Preists of Life
		e.other:Faction(135,5,0); -- Guards of Qeynos
		e.other:Faction(21,-10,0); -- Bloodsabers
		e.other:AddEXP(500);
		e.other:GiveCash(7,5,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1043 -- Wolten_Grafe 

