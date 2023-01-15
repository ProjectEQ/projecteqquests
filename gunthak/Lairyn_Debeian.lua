-- items: 17194, 58009, 59021, 52354, 52344
local add_waves;

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		if(e.other:Class() == "Wizard") then
			e.self:Emote("peers up from his journal and smiles at you warmly, 'Greetings, friend. I was so involved in my research that I did not hear you approaching.' He closes the leather-bound tome and pats it with one slender hand. 'Please forgive my lack of courtesy. I am Lairyn from the order of the Crimson Hands, and this little book here is my life's work. I am currently unraveling the secret of a [" .. eq.say_link("new power") .. "] that has emerged on Broken Skull Rock.");
		else
			e.self:Emote("stares at you directly in the eyes. 'Greetings, " .. e.other:GetName() .. ".  I suppose you're here like everyone else in search of fame and fortune.  Good luck to you, and good day.  I have many things to attend to.");
		end
	elseif(e.message:findi("new power")) then
		e.self:Say("The strange beasts known as Luggalds that reside on Broken Skull Rock have an amazing power over the dark waters of the deep. They are able to conjure it up in the form of an immense spear of ice. I have seen them do so with my own eyes, though I was watching from afar, of course. I would not dare venture close enough to anger the foul beasts. Their grasp of this magic is simply breathtaking, and from my observations alone, I am very close to unlocking their methods. Unfortunately, I have run into an obstacle, as I cannot complete my research without something more tangible. If only I were brave enough to get closer, or foolish enough. As you can see, I am more intellectual than adventurer.");
		e.self:Emote("chuckles and his spectacles slip a little further down his nose.");
	elseif(e.message:findi("brave enough")) then
		e.self:Emote("gasps in apparent surprise, 'What? Are you certain you wish to put yourself in such a perilous position? Well I certainly can't turn down good help, so I'll tell you what I know. The Luggalds often utilize their spells against creatures in the waters of the harbor. Whether this is for practice, or for sport, or to ward off attackers I am not sure. I would suggest investigating the harbor for further evidence. Take this bag and bring me whatever you can find.");
		e.other:SummonItem(17194); -- Item: Small Pouch
	elseif(e.message:findi("lirprin sent me") and qglobals["Fatestealer"] == "3") then
		e.self:Emote("is disturbingly pale for an Erudite. He looks terribly frightened. 'They'll return any moment! The shadows are everywhere, always watching . . . Waiting for me to rest so they can kill me. I try to fight them off but they always return. They whisper to me when I am all alone. No one else in the gulf believes me. You must help! Please believe that what I say is true!");
		e.self:Say("Oh no, here they come - please don't let the shadows take me away!");
		add_waves=0;
		e.self:SetRunning(true);
		e.self:MoveTo(-54.34,1584,2.9,138,true);
		eq.set_timer("move1",2000);
	end
end

function event_spawn(e)
	eq.depop_all(224433);
	eq.depop_all(224434);
	eq.depop_all(224435);
	eq.depop_all(224436);
end

function event_timer(e)
	if e.timer=="move1" then
		eq.stop_timer("move1");
		e.self:MoveTo(-309,339,-45,135,true);
		eq.set_timer("move2",45*1000);
	elseif e.timer=="move2" then
		eq.stop_timer("move2");
		e.self:MoveTo(-315.17,-474.23,18.2,0,true);
		eq.set_timer("move3",30*1000);
	elseif e.timer=="move3" then	
		eq.stop_timer("move3");
		e.self:Shout("They're still following me! Help!");
		eq.set_timer("adds",3000);
	elseif e.timer=="adds" then
		eq.set_timer("adds",55*1000);		
		if add_waves < 5 then
			eq.spawn2(224433,0,0,e.self:GetX()-15,e.self:GetY()-15,e.self:GetZ()+3,e.self:GetHeading()):AddToHateList(e.self,500); --thug
			eq.spawn2(224434,0,0,e.self:GetX()+15,e.self:GetY()-15,e.self:GetZ()+3,e.self:GetHeading()):AddToHateList(e.self,500); --assass
			eq.spawn2(224435,0,0,e.self:GetX()   ,e.self:GetY()-15,e.self:GetZ()+3,e.self:GetHeading()):AddToHateList(e.self,500); --enforce
		else
			eq.stop_timer("adds");
		end		
		add_waves=add_waves+1;
		eq.set_global("rog_epic_wave",tostring(add_waves),3,"H2");		
	end
end

function event_signal(e)
	if e.signal==1 then
		e.self:Say("Oh no . . . I'd recognize the echo of those footfalls anywhere. That sounds like Krill . . .'");
		eq.spawn2(224436,0,0,e.self:GetX()-15,e.self:GetY()-15,e.self:GetZ()+3,e.self:GetHeading()):AddToHateList(e.self,500); -- NPC: Krill_the_Backbleeder
	else
		e.self:Say("For my own knowledge and to bring some closure to this terror, can you bring me his head? I want to see with my own eyes. I need to know if it was him.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 58009}) ) then --pouch of dark ice
		e.self:Say("You did it. I can scarely believe my eyes! This is wonderful. Let me have a closer look. Lairyn unbuckles the leather satchel and pours out the contents then begins arranging the shards in a pattern on the ground. He slides them around like pieces of a complex puzzle, swapping them backwards and forwards faster than your eyes can track. Ah yes, very clever. I am beginning to understand. This is not such a challenge after all, once you know the trick. Enough talk, I would like you to be the first to try it! Lairyn withdraws his journal again and flips through it until he locates a blank page. He scribbles furiously with a quill for several moments, then tears the page form the binding and hands it to you.");
		e.other:SummonItem(59021); --spell: frozen harpoon
	elseif(item_lib.check_turn_in(e.trade, {item1 = 52354}) ) then --cloudy potion
		e.self:SetHP(e.self:GetHP()+3000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 52344}) ) then --krill head
		e.self:Emote("adjusts his spectacles and peers at the head, 'True enough. This is a Wayfarer . . . Errr, was at one time. I imagine he renounced his membership in the Brotherhood sometime before he took up a career of tormenting a poor scholar. They must have been trying to get to Nedaria by coming after me. I am famliar with Krill and he is a follower, not a leader. Someone else is the mastermind behind this - a person with access to magical disguises to hide their identity. Lirprin must know of this at once, ".. e.other:GetName() .. ".");
		eq.set_global("rogue_epic_lairyn","1",5,"F");
		eq.depop_with_timer();
		e.other:Message(15,"You have confirmed Lairyn's innocence.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end