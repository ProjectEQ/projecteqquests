-- items: 17174, 54010, 54024
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, Citizen. In this time of piracy on the high seas, your [duty] is clear, is it not?");
	elseif(e.message:findi("duty")) then
		e.self:Say("What duty? To your state and your fellow man, that is what duty! These attacks must be stopped, before all order is lost and the city falls to [vermin]! We must strike them down first, with strength and determination; this could get out of hand.");
	elseif(e.message:findi("vermin")) then
		e.self:Say("The pirates of Broken Skull Rock are uncouth and relentless. They take whatever they may want, ruining trade lines without regard to the might of such established cities as Freeport. The rotten thieves are all thrown and mixed together in filthy shantytowns from what I hear, so striking at their heart should not be terribly difficult. Your [mission] is clear.");
	elseif(e.message:findi("mission")) then
		e.self:Say("Go to Broken Skull Rock! Slay these impudent pirates and wreak havoc on their plans. Some of them carry a seal that grants passage about their society, bring me ten of these such seals and your duty to your city shall be fulfilled. We might even have some form of [reward] for you.");
	elseif(e.message:findi("reward")) then
		e.self:Say("First the seals, then the reward! Take this to transport them in.");
		e.other:SummonItem(17174); -- Item: Militia Crate
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 54010})) then
		e.self:Say(string.format("Excellent work, %s!  This will teach the pirates of Broken Skull a lesson and help our cause in repelling them.  Here is your reward.",e.other:GetName()));
		e.other:SummonItem(54024); -- Item: Twisted Silver Torque
		e.other:Ding();
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
