function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s hollow eyes look up at you. You have the distinct impression that she can see right into the darkest shadows of your soul. She opens her mouth to speak but the sounds you hear come from inside your mind. 'Greetings mortal, thank you for releasing me from my [tormented prison].");
	elseif(e.message:findi("tormented prison")) then
		e.self:Emote(" appears to be fading in and out of existence as you speak to her. The spirit's voice fills your mind. 'I am Akelha`Ra, once high priestess of Luclin and leader of the Akheva. This form you see before you now is a fading remnant of my former existence. The storm was the cause of my imprisonment in the world of undying [spirits].");
	elseif(e.message:findi("spirits")) then
		e.self:Say("We Akheva are immortal entities placed in this plane by the mistrees of shadow. We are her most perfect creation. Death has no meaning to us, as even in death we find rebirth through the power of the mistress. My imprisonment was caused by my seperation from the power of the mistress by [Atenha`Ra]. It was she who sent the storm to destroy me and all that followed me.");
	elseif(e.message:findi("atenha`ra")) then
		e.self:Say("It is more then a little ironic that Atenha`Ra is a reflection of myself. An entity created from my own consciousness, a reflection of a shadow. She now holds the seat of grand power in [Vex Thal], and I have not the power to gain entry to the city, let alone face her. You must find my scepter that was lost in the storm to gain entry to Vex Thal. The scepter has likely lost much of its power from being shattered. Once it is reassembled you will need to merge a Orb of Luclinite with a source of celestial power inside the scepter. The spirits whisper that the emperor of the Shissar holds the power to manipulate such energy. Be weary of him, he is heralded as the slayer of gods, the defiler of realities.");
	elseif(e.message:findi("vex thal")) then
		e.self:Say("Vex Thal is the sacred home of the Akheva. The place where Luclin's power directly touches this world...ungh...I can not summon the frame of my scepter in my current weakened state. I need a soul to regain my pow...' As she speaks you can see her slowly fade out of existence. You wonder how long her spirit will stay with this world. She seems entirely unable to speak to you now, and can only muster the strength to point at the ground at " .. e.other:GetName() .. "'s feet. " .. e.other:GetName() .. " reaches down a picks up a small emerald off the ground, but it disappears silently into the shadows. Akelha`ra looks as if she is trying to speak again.");
	elseif(e.message:findi("frame") or e.message:findi("scepter")) then
		e.self:Emote(" opens her mouth to speak, but the voice in your head is no longer audible. You reach forward to touch the fading shadow of a creature and draw back in horror as your hand disrupts the spirit before you. She evaporates into the shadows once more.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9963})) then
		e.self:Emote(" laughs quietly as the energy of the gem is absorbed into her being. She begins to chant in what you presume to be Akhevan. She suddenly cries out in pain and her image begins to flicker. She looks at " .. e.other:GetName() .. " directly in the eyes and says, 'Vyanemis Tuis, use my gift wisely.' She disappears into the black marble leaving only a dark scepter frame lying on the floor. " .. e.other:GetName() .. " picks it up.");
		e.other:SummonItem(17323); -- Item: Shadowed Scepter Frame
		e.other:AddEXP(20000);
		e.other:Ding();
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--End of File, Zone:akheva  NPC:179144 -- --The_Spirit_of_Akelha-Ra.pl
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
