local event_started=0;


function event_spawn(e)
	event_started=0;
end


function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if (event_started==1) then
		e.self:Emote("is struggling to keep his eyes open, 'Well done. Of the thousands of battles I have observed in my days, none have ever fought more valiantly then yourself. You should...get out of here before someone finds us like this. War will come. It always does. Turmoil...is life's one constant. It is inevitable. Don't...worry. You tried.'");
		eq.depop_with_timer();
		eq.debug("depop_with_timer");
	elseif(e.message:findi("hail")) then
		e.self:Emote("Greetings, "..e.other:GetRace()..". Don't worry, I will not make any aggressive actions toward you. Look around. Do you see the bars, the guarded exits? This is a prison - a comfortable location but a cage nonetheless. I am only guilty of [" .. eq.say_link("one crime") .. "], but the repercussions are serious. It's likely that the remainder of my life will be spent in closely guarded captivity.");
	elseif(e.message:findi("crime")) then
		e.self:Emote("lifts his chin proudly, 'My crime? Simply being who I am. Daignal. A Dragorn with the will to do what is right for my people, the might to destroy my enemies in battle, and the respect and reputation to call hundreds, if not thousands, of fellow Dragorn to my aid. The legions of Mata Muram have wisely decided to cage me rather than make me [" .. eq.say_link("into a martyr") .. "] and face an uprising. No one, including me, wants that. It would be a valiant but futile attempt to thwart their control over this world and succeed only in generating a catastrophic body count. I've already seen enough bloodshed to last a thousand lifetimes.");
	elseif(e.message:findi("martyr")) then
		e.self:Say("Were the Muramites, or anyone else for that matter, to lay a hand on me, the retribution from my people would be fierce. Total war. But this will never occur. As I said, [" .. eq.say_link("no one wants needless bloodshed") .. "].");
	elseif(e.message:findi("bloodshed")) then
		e.self:Say("Precisely. No sane person wishes for needless bloodshed.");
	elseif(e.message:findi("kill")) then
		if(qglobals["Fatestealer"] == "3" and qglobals["rogue_epic_keetra"] == "1" and qglobals["rogue_epic_lairyn"] == "1" and qglobals["rogue_epic_larithim"] == "1" and qglobals["rogue_epic_durgin"] == "1") then
			event_started=0
			eq.spawn2(336253,0,0,694,828.2,145.2,240); -- NPC: #Wren_Simsy
		else
			e.self:Say("you are speaking jibberish, what proof do you have?");
		end
	end
end

function event_signal(e)
	if e.signal==1 then
		e.self:Emote("cries out in pain");
		e.self:SetAppearance(3);
		event_started=1;
	end
end
