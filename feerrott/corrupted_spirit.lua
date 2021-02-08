-- items: 62837
function event_say(e)
local qglobals = eq.get_qglobals(e.other)
	if(qglobals["druid_epic"] == "3" and e.message:findi("Who are you?")) then
		e.self:Say("You don't even know who I am? You summon me back here and you don't even know me? There's no way I'll. . .' The voice wavers as it struggles to deny an answer to your question. The struggle is short, however, and he continues. 'Gah! Fine, my name is Sanmuel Gingerfly of Qeynos.");
	elseif(e.message:findi("What about the disease?")) then
		e.self:Say("What do you want to know about disease? I'm kind of an expert. I know something about a great plague that you will soon die from! I helped create it!");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("What plague?")) then
		e.self:Say("I know that it is a special plague, designed by. . .' again he tries to resist speaking, but the power of the gem that binds him into his own skull is too powerful, 'Azibelle and the Afflicted. Oh, she's gonna be mad at me. It will grow in the plants and be eaten by the animals. It won't show any signs for a long time. By then you'll all have eaten something with the plague! I got to deliver some of it to the first victims! I even remember one of the key runes. I. . .' again the hesitation, 'can [" .. eq.say_link("show it") .. "] to you if you want.");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("show it")) then
		e.other:Message(0,"The skull of the dead acolyte glows briefly and all of the remaining flesh falls from it. An ephemeral rune appears in your hand. 'Place that where that horrible stone was before, in my very own head with that nasty scroll, and you will be able to engrave it into my skull. My poor skull! Hurry up, though, that rune won't last forever.");
		e.other:SummonItem(62837); --Disease Rune
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("Who are Azibelle and the Afflicted?")) then
		e.self:Say("I won't tell you!' The voice goes silent for a few moments and you fear that he might have broken the spell, but his voice returns. 'The Afflicted were created by Azibelle shortly after Mordavin was killed. When the Bloodsabers refused to protect Mordavin, she broke from them and took some key members with her. Glenfire is her right hand, a wicked woman with great power. The others she has brought in are Finnelzi Springworthy, Rendolf Deathbringer, Tehana Elsent and my brother, Bohab.");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("Who is Glenfire?")) then
		e.self:Say("She's the most powerful woman I've ever met. She's a dark elven shadowknight and if I were you I'd stay away from her. Nobody has ever beat her in a fight and I don't think she tries her hardest.");	
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("Who is Finnelzi Springworthy?")) then
		e.self:Say("Fin? He's a gnome. I suppose he's a powerful necromancer, but it's hard to fear someone that can't see over a low hedge. Besides, I always suspected that he had reservations about our work. I should have had his place in the coven!");	
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("Who is Rendolf Deathbringer?")) then
		e.self:Say("Heh. He used to be called Rendolf Shelton. He changed his name so he'd sound more like a shadowknight. He's a great fighter, though, so nobody teases him about it. I think he has a crush on Glenfire, but she'd rather kill a human than sleep with one.");	
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("Who is Tehana Elsent?")) then
		e.self:Say("Tehana is a true necromancer. She studies the lore and the spells. She knows everything there is to know about the undead. She has been studying diseases, but I don't think they really meant much to her except that they make people dead. She was the one to recreate some of Mordavin's work from his notes and repurposed it for Azibelle's needs. She's kind of excited about killing everyone. She is inspired by Azibelle and Glenfire and does most of the support work for the coven.");			
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("Who is Bohab?")) then
		e.self:Say("I won't tell you anything about him. He protected me as a child in the streets of Qeynos and I will not tell you anything about him.");		
	end
end

function event_trade(e)
	local item_lib = require("items");	
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end

function event_spawn(e)
	eq.set_timer("depop",300*1000);
end