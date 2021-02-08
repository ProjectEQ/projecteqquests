-- items: 52337, 52347, 47100, 52342, 21346
local mirb = {
	expedition = { name="Miragul's Menagerie: Frozen Nightmare", min_players=6, max_players=54 },
	instance   = { zone="mirb", version=50, duration=eq.seconds("3h") },
	compass    = { zone="everfrost", x=-5457.705, y=-827.538, z=187.38 },
	safereturn = { zone="everfrost", x=-5461.0, y=-848.0, z=190.0, h=0 },
	zonein     = { x=607.0, y=1504.0, z=28.0, h=156.0 }
}

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["Fatestealer"] == "1" and qglobals["Fatestealer_bard"] == "1" and e.message:findi("hail")) then
		e.self:Say("I suppose the bad publicity surrounding your organization has subsided to the point where we can speak freely.' He clears his throat, 'Word is that you are looking for someone to forge a blade or two specifically for you for a specific purpose. I'll go on faith that you intend to use this weapon to catch a criminal and not become one yourself. We have the ability. My assistant, Dandi, is the best smith I know. And . . . As luck would have it I owe your friends a [" .. eq.say_link("favor") .. "]. The only thing we lack is the knowledge of how to imbue the weapon with dark energy. I thought this secret lied in the hands of the Teir`dal, but if they will not acquiesce perhaps there is another way. Did you ever stop to think that the directions may have been written down somewhere?");
	elseif(e.message:findi("favor")) then
		e.self:Say("Let's get one thing straight, right now, " .. e.other:GetName() .. ". I do NOT work for Stanos, and I do NOT work for you. It's a simple matter of repaying a favor, and I'd suggest you not press the issue lest I change my mind.");
	elseif(e.other:HasItem(52347)) then
		if(e.message:findi("hail")) then
			e.self:Say("I'm sure Stanos has already briefed you on his concern: An assassin is planning to start a war between the Dragorn and the Wayfarer's by offing a well-respected member of their society and making it look like it was us. This is true. I've verified the information myself. What Stanos doesn't know, and I'm embarrassed to admit . . . It's one of my people that's behind it all.' He fumes, and smashes his left fist into his opposite palm. 'Bah. If I ever get my hands on the scoundrel! If I even knew WHICH one it was! We've had a disturbing number of our rank go 'deserter' since my group's last visit to the Realms of Discord. Haven't heard from some of my members in days, weeks, or months. It's one of those scumbags.");
			e.self:Say("I'd bet my [" .. eq.say_link("bronze breastplate") .. "] that it's either [" .. eq.say_link("Lairyn Debeian").."], ["..eq.say_link("Wren Simsy").."], ["..eq.say_link("Longarm Larithim") .."], [" .. eq.say_link("Durgin Skell") .. "] or [" .. eq.say_link("Keetra the Lost") .. "]. If you can prove without a shadow of a doubt, please tell me you [" .. eq.say_link("know who is guilty") .. "].");
			eq.set_global("Fatestealer","3",5,"F");
		elseif(e.message:findi("Lairyn")) then
			e.self:Say("Yes, Lairyn Debeian. Does his name sound familiar to you? It should - that's Nedaria's brother. He left my side long ago to research new magics, and for the better part of the years he kept in touch. We had been corresponding by mail. The last letter I received from him was written in a desperate scrawl. His tone was fearful and angry, which isn't like him at all. He spoke of shadows and hearing voices in his head. I'm afraid he may have done something rash. Something horrible. Don't let his frail appearance fool you, Fyredragn. He's from the same blood as Nedaria and very powerful. If you find him, drop my name. Let him know Lirprin sent you and see if he can explain his odd behavior.");
		elseif(e.message:findi("Wren")) then
			e.self:Say("Ah, Wren. Mistress of disguise and as deadly as they come. She always obeyed orders and was ruthlessly efficient in her tasks, but I've got this feeling that what she did for the Brotherhood was done begrudgingly. That is to say, I think she was biding her time waiting for an opportunity to leave. And leave she did. She and some of the impressionable members of my group disappeared a few weeks ago. In typical rogue-like fashion, they made off with most of our supplies, too. The more unsavory Wayfarer pledges were quite taken with her striking beauty and her skill with a blade. I imagine they'd follow her anywhere. If you find her, drop my name. Let her know Lirprin sent you and see if she can explain her disappearance and theft.");
		elseif(e.message:findi("Longarm")) then
			e.self:Say("Bah, just hearing his name is like hearing the screech of a harpy. The little twerp didn't care for the dangerous environment of Kuaa and deserted us without so much as a goodbye. This is the kind of behavior I have to deal with on a daily basis, and what's going to be the death of me. I swear I'll throw shackles on the next walking panic attack that whimpers about wanting to go back to their home. It goes without saying that Larithim was a roguish type and I wouldn't put it past him to do something rash and stupid. Someone overheard him saying he'd do anything to send us packing back to Norrath, for good. Starting a war with the Dragorn would fit that bill. Who knows what hole Larithim's cowering in now. There are a lot of hiding spots for a fainthearted three-foot tall gnome. If you find him, drop my name. Let him know Lirprin sent you and see if he can explain his desertion.");
		elseif(e.message:findi("Durgin")) then
			e.self:Say("I've had the pleasure of serving with a beastlord named Sharalla for quite awhile. For years, she was a reliable friend and companion. At one point I nearly asked her to become my betrothed - we were that close. However, things changed the moment she met that scoundrel Durgin Skell. Her dedication to the Wayfarer's cause wavered noticably whenever he was about. Last time I saw them, Durgin and Sharalla were preparing for [some foolish expedition]. They took a cadre of my best people, ventured off in search a 'great threat' to Norrath and haven't been seen since. I trust Durgin about as far as I can pitch an orc. There's a good chance he's used his silver tongue and charismatic appearance to misguide his group into doing something foolish. If you find him, drop my name. Let him know Lirprin sent you and see if he can explain what he's been up to.");
		elseif(e.message:findi("foolish")) then
			e.self:Say("Yes, foolish indeed. He kept mentioning something about a frozen underground cavern below Everfrost and the nightmarish creatures that resided within. We had heard rumors of such a place, but I wouldn't give them much credibility. They're only rumors, after all.");
			e.other:CreateExpedition(mirb)
		elseif(e.message:findi("Keetra")) then
			e.self:Say("'Keetra the Lost' is right. She was simply 'Keetra' until we discovered her uncanny knack for straying off the beaten path. We couldn't travel half a mile without having to double back to find Keetra. You don't want to know how many times we sent a search team to locate her sorry hide. What I need to know is, was this simply absent-minded disorientation or was she feigning ignorance, trying to escape? I'm inclined to say it was the former, but with this war on the horizon we can't be too careful. Having another thief slip out of sight is not something we can afford to ignore. If you find her, drop my name. Let her know Lirprin sent you and see if she can explain where she's been.");
		elseif(e.message:findi("bronze breastplate")) then
			e.self:Emote("sighs, I'm not really wearing a bronze breastplate, " .. e.other:GetName() .. ". That's what we like to call a 'figure of speech'.");
		elseif(e.message:findi("know")) then
			if(qglobals["Fatestealer_lairyn"]) then
				e.self:Say("placeholder");
			else
				e.self:Emote("taps his foot impatiently. There's no time to tarry, " .. e.other:GetName() .. ". So far, your research has turned up nothing at all. Keep looking for [" .. eq.say_link("Lairyn Debeian").."], ["..eq.say_link("Wren Simsy").."], ["..eq.say_link("Longarm Larithim") .."], [" .. eq.say_link("Durgin Skell") .. "] and [" .. eq.say_link("Keetra the Lost") .. "].. Come back and speak with me when you know more.");
			end
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);

	if( qglobals["Fatestealer_bard"] == "1" and qglobals["Fatestealer_page"] == "1" and qglobals["Fatestealer_forge"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 52337}) ) then 
		e.self:Emote("discusses the process with his assistant. She listens, nodding, then begins work immediately. She takes measurements of your hands and fashions the grip so that it's a perfect fit, then turns to the hot coals of the forge. She selects a brick of fine metal. Her back to you, Dandi hammers away at the metal, sparks flying in all directions. When the job is completed she hands you the blade, still warm. 'Best work I've ever done. I hope it serves you well. Unfortunately the metal I have to work with isn't the recommended 'Velixite'. Based on the description I used the closest thing we have. Also, without an example to work from I had to improvise on a few details that weren't fully described in your documentation.");
		e.other:SummonItem(52347); -- Item: Fatestealer
		e.other:AddAAPoints(5);
		e.other:Ding();
		e.other:Message(15,'You have gained 5 ability points!');
		eq.set_global("Fatestealer","2",5,"F");
	end
	if( qglobals["Fatestealer"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 47100,item2 = 52342,item3 = 21346,item4 = 52347}) ) then
		e.other:QuestReward(e.self,{itemid=52348, exp=50000}); --Nightshade, Blade of Entropy
		e.other:AddAAPoints(10);
		e.other:Message(15,'You have gained 10 ability points!');
		eq.set_global("Fatestealer","4",5,"F");
		eq.delete_global("Fatestealer_bard");
		eq.delete_global("Fatestealer_page");
		eq.delete_global("Fatestealer_forge");
		eq.delete_global("Fatestealer_nk");
		eq.delete_global("Fatestealer_sv");
		eq.delete_global("Fatestealer_hl");
		eq.delete_global("Fatestealer_pl");
		eq.delete_global("Fatestealer_rv");
		eq.delete_global("rogue_epic_keetra");
		eq.delete_global("rogue_epic_lairyn");
		eq.delete_global("rogue_epic_durgin");
		eq.delete_global("rogue_epic_larithim");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
