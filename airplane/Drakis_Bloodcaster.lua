-- Necromancer Epic NPC -- Drakis_Bloodcaster
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:Race() .. ". Are you ready to begin?");
	elseif(e.message:findi("ready to begin")) then
		e.self:Say("Who would you like to be tested by? Jzil or Dugaas?");
	elseif(e.message:findi("jzil")) then
		e.self:Say("Very well.");
		eq.spawn2(71074,0,0,654.9,1305,-762.2,44); -- NPC: Jzil_GSix
		eq.depop_with_timer();
	elseif((e.message:findi("Dugaas")) and (e.other:Class() == "Necromancer")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71084,0,0,661.6,1302.8,-766.9,509.8); -- NPC: Dugaas_Helpyre
		eq.depop_with_timer();
	end
end
