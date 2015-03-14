function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Bless you. my friend!  We always welcome new converts into our Hall of Truth.  The righteous army of the twin deities must assemble.  The battle draws near.  The blessings of the Truthbringer are passed to all who are [devoted to truth].");
	elseif(e.message:findi("fallen knight")) then
			e.self:Say("The fallen knight is Sir Lucan D'Lere. The organizer and leader of the Freeport Militia. He once stood beside us. Now he shall burn!! We will end him. We shall [crush the Freeport Militia]. Truth shall reign once again.");
	elseif(e.message:findi("true organizer")) then
			e.self:Say("Captain Hazran is the commander of the Freeport Militia. Lucan has no time to waste on relegating duties. Hazran is the one who keeps these brutes together as a militia. Stop him and maybe the militia will collapse. Find a way to return his head to me. That would surely bring great thanks from this temple.");
	elseif(e.message:findi("devoted to truth")) then
		if(fac < 5) then
			e.self:Say("May the hand of Marr shield you from harm. Welcome to our world. The war begins here in Freeport. The [fallen knight] has masked the truth from the world, but he cannot mask his evil from the Truthbringer. He once followed our ways. Now he is our enemy and yours. We must end his rule. We must [crush the Freeport Militia]!!");
			e.self:CastSpell(11,e.other:GetID());
		else
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		end
	elseif(e.message:findi("crush the freeport militia")) then
		if(fac < 5) then
			e.self:Say("'Our goal is to end their rule. To retake our city in the name of Marr. Let it begin with their blood!! Slay the militia!! They have no souls and hail from the back alleys and prison cells of darkness and depravity. Thieves and murderers, nothing more. Slay any you can and, as proof, return their militia helms to me. We shall see what bounty you deserve.");
		else
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13921})) then
		e.self:Say("Bless you, my child. Marr is grateful, as are we. Here is our thanks. Let it bring you greater strength to defeat the Militia. Go and continue the crusade. Soon you will be strong enough to slay the [true organizer].");
		e.other:Ding();
		e.other:Faction(184,3,0);
		e.other:Faction(258,3,0);
		e.other:Faction(48,-10,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(311,10,0);
		e.other:AddEXP(5000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12142})) then
		e.self:Say("We heard of your assault. We even attempted to slay Lucan. Alas, we failed. You have done your part and as such have earned our thanks. Beware of the Freeport Militia. They will no doubt be on the lookout for you. May Marr protect you. Perhaps you should speak with Valeron Dushire, paladin of the Knights of Truth. He seeks other to slay the fallen knight.");
		e.other:SummonItem(eq.ChooseRandom(15560,15230,15219,15229,15222,15012));
		e.other:Ding();
		e.other:Faction(184,3,0);
		e.other:Faction(258,3,0);
		e.other:Faction(48,-10,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(311,10,0);
		e.other:AddEXP(5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
