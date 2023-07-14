function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to travel to the [" .. eq.say_link("Ocean of Tears",false,"Ocean of Tears") .. "] in the meantime, I can transport you to my companion there.");
	elseif(e.message:findi("ocean of tears")) then
		e.self:Say("On your way");
	eq.SelfCast(2279);
  end
end