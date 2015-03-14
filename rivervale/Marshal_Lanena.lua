function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ".  I am Lanena Wickystick. marshal of all Vale concerns.  If there are any troubles brewing in our fine town which concern the Guardians of the Vale. please inform me.  You must be a [new deputy] or are you an [outsider]?");
	elseif(e.message:findi("new deputy") and fac > 2 and fac < 5) then
		e.self:Say("It is good to see such fine stock in the ranks of the Guardians.  Being new. there is much to learn. in battle and in life itself.  If you are not presently obligated. we have need of you here in the hollow.  There seems to be a [small problem].");
	elseif(e.message:findi("new deputy") and fac == 5) then
		e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");
	elseif(e.message:findi("outsider")) then
		e.self:Say("Well. then!! You should not be in here.  This place is restricted to all outsiders.  You will leave at once!  Thank you and good day.");
	elseif(e.message:findi("small problem")) then
		e.self:Say("For months. Fiddy Bobick has petitioned the marshals to assist him with a problem he has.  With the addition of new deputies such as yourself. we can now give him the assistance he requires.  Just go down to Bobick's shop near the lake.  Tell him I sent you.");
	elseif(e.message:findi("rantho rapier")) then
		e.self:Say("The Rantho Rapier was crafted by the great blacksmith Rantho Goobler.  It was designed for use by the warriors of the wee folk.  With its light weight and special two-hand hilt, it becomes a formidable weapon in the hands of our younger deputies.  Only a [new deputy] has the right to earn one.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13870})) then
		e.self:Say("What was I thinking?!! Piranha are coming downstream and eating our supply of fish! We have never had a problem like this!!  Where are these little beasts coming from?  For now we must collect more. Take this bag. Collect enough teeth to fill the bag. Don't worry, if it takes a while I shall reward you with the [Rantho Rapier].  We will need to examine the teeth.");
		e.other:SummonItem(17968);
		e.other:Ding();
		e.other:Faction(133,10,0);
		e.other:Faction(208,10,0);
		e.other:Faction(316,10,0);
		e.other:Faction(218,10,0);
		e.other:Faction(88,-10,0);
		e.other:AddEXP(200);
		e.other:GiveCash(0,1,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12155})) then
		e.self:Say("Fine work. We shall continue to study these and shall determine if we need to seek the source.");
		e.other:SummonItem(5423);
		e.other:Ding();
		e.other:Faction(133,15,0);
		e.other:Faction(208,15,0);
		e.other:Faction(316,15,0);
		e.other:Faction(218,15,0);
		e.other:Faction(88,-20,0);
		e.other:AddEXP(200);
		e.other:GiveCash(0,1,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19061 -- Marshal_Lanena
