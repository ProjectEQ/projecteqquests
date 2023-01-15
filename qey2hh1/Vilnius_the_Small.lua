-- Rogue Epic NPC -- Vilnius_the_Small
-- items: 28014, 5411, 5410, 5401, 5308, 7506, 1357, 1253, 1354, 1360, 7505, 7041, 7509, 7508, 7020

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("%s, just because I am short don't mean I can't bounce your %s rump all over these hills. Now, do you have something for me, or are you just in search of a rump bouncing?",e.other:GetName(),e.other:Race()));
	elseif(e.message:findi("rump")) then
		e.self:Say("My pleasure to oblige you then. Shall I start on the left side or the right side?");
		eq.attack(e.other:GetName());
	elseif(e.message:findi("you")) then
		e.self:Say("Vilnius, as I have told you. And yes, I am not as large as most of my kin. But that is a blessing, because my brain is bigger than that of an $race. <grin> I am a Facilitator. I.. facilitate.. jobs. You want something somebody else has, I can arrange for you to have it.. even if that something is their life. That is why I am here now, waiting on something to turn up in my hands before I pass it on to my client. Though I am a bit tired of waiting. My hired help seem to be delayed.");
	elseif(e.message:findi("malka")) then
		e.self:Say("Malka Rale works for me from time to time. One of the best thieves I have ever met, and damn handy with a blade. She is long overdue to meet me here. I'm afraid she may have run into trouble in Qeynos.");
	elseif(e.message:findi("delayed")) then
		e.self:Say("Yes, delayed. She has always been prompt in the past, but she is several days overdue, and I know for a fact she completed the job. I am beginning to wonder if something happened to her. I would go check, but I run the risk of missing her if she shows up here.");
	elseif(e.message:findi("job")) then
		e.self:Say("I need a few more items for a collector. They are rare and valuable, but I will pay you well for your trouble. I need the sword owned by the king of the Frogloks, the sword my distant cousin Karg is so proud of, and the matched set of Painbringer and Fleshripper, held by the kobolds. Return those to me quickly, and we will take it from there, eh?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 28014})) then -- Stanos' Pouch
		e.self:Say("Ah, very nice. Very nice indeed. Good work, and I hope Malka is able to make it out, good help is hard to find. But in the meantime, I am without an acquisition expert. Do you want the job?");
		e.other:AddEXP(1500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 5411,item2 = 5410,item3 = 5401,item4 = 5308})) then -- Fleshripper, Painbringer, Mithril Two-Handed Sword, Gigantic Zweihander
		e.self:Say("Very good, though how you managed to lug around all these oversized blades amazes me. I feel we can do business now, and Malka still has not shown up. Take this dagger. I had an old client who didn't, um.. pay.. so this was extracted from him. Right after it was inserted in him. For your next job, I need a collection of robes. The Robe of the Ishva, some Shining Metallic robes, an Oracle robe, and a Robe of the Kedge. I am not even sure where all these come from, but they are on my list here, and Rokyl is one of my best clients, so I figure that is your job.");
		e.other:SummonItem(7506); -- Jagged Diamond Dagger
		e.other:Ding();
		e.other:AddEXP(3000);
		e.other:GiveCash(0,0,100,20);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1357,item2 = 1253,item3 = 1354,item4 = 1360})) then -- Robe of the Ishva, Robe of the Kedge, Robe of the Oracle, Shining Mettalic Robes
		e.self:Say(string.format("You do good work, %s. Here is another trinket for your trouble, you should be able to make use of it. Malka still hasn't made it back yet, and I have one more order to fill, if you're willing. This one should be easy. My sword collector has decided he wants rapiers now, of all things. He has asked for an Eyerazzia, a Martune Rapier, a Burning Rapier, and a well balanced rapier.",e.other:Race()));
		e.other:SummonItem(7505); -- Cazic Quill
		e.other:Ding();
		e.other:AddEXP(3000);
		e.other:GiveCash(0,0,200,15);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 7041,item2 = 7509,item3 = 7508,item4 = 7020})) then -- Burning Rapier, Martune Rapier, Eyerazzia, Well-Balanced Rapier
		e.self:Say(string.format("You never cease to amaze me! I never thought you %s types could be so good at this sort of work. I have been stuck here and haven't any more trinkets to give you, but perhaps you could take this pouch to its new owner, since I do not have the time to deliver it myself. He will pay you in full, and you can just keep what he gives you, how does that sound? The owner is a man named Stanos Herkanor, and he or his friend Anson are supposed to meet me in Highpass this evening. Do not waste too much time getting there, he is a secretive man, and I can not guarantee he will be around long. Good luck, and maybe we will meet again. It is always a pleasure working with another professional such as yourself!",e.other:Race()));
		e.other:SummonItem(28014); -- Stanos' Pouch
		e.other:Ding();
		e.other:AddEXP(3000);
		e.other:GiveCash(0,0,300,10);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE  Zone:qey2hh1  ID:12019 -- Vilnius_the_Small