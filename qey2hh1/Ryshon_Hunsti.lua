-- Part of Ghoulbane quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, %s. What brings you to the Karanas? Do you seek [enlightenment]?",e.other:GetName()));
	elseif(e.message:findi("enlightenment")) then
		e.self:Say("Ahh, i could see by the look in your eyes that you are looking for something more than just enlightenment. Perhaps you are looking for a [sword] crafted by a noble man.");
	elseif(e.message:findi("looking for a sword")) then
		e.self:Say("It is not just a sword friend. It is much more than that. This sword carries with it special [power], something unlike anything else within this realm.");
	elseif(e.message:findi("power")) then
		e.self:Say("It is an instrument fashioned together by a noble man. It is said to be blessed by the gods themselves. Only a man who comes from nobility may wield it. Do you seek the [sword of nobility]?");
	elseif(e.message:findi("sword of nobility")) then
		e.self:Say("I see.  Then take this note to Kanthuk Ogrebane. I've been told he can be found fishing not far from the dwarven city.");
		e.other:SummonItem(2416);
	end
end

-- Quest edited by mystic414
-- Converted to Lua by robregen