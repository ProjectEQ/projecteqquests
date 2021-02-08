-- items: 69971, 69972
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
		
	if(e.message:findi("hail")) then
		if(e.other:HasItem(69941) and e.other:HasItem(69952) and e.other:HasItem(69942)) then
			e.self:Say(e.other:GetName() .. " see you have returned with three Soulstones. These crystals are very delicate and hold the souls of those tormented beings. The keepers of these Soulstones were being controlled by some superior being, someone dark and evil in nature. I will need you to find one more Soulstone, so that we can find out who is behind all of this. This final tormented soul I feel is a Erudite...a Wayfarer Erudite, though I cannot discern where this person is. Please hurry and find this tormented being.");
			eq.set_global("paladin_epic","6",5,"F");
		elseif(e.other:HasItem(10099) or e.other:HasItem(69913)) then --has fiery defender or Couragebringer.
			e.self:Say("Ah " .. e.other:GetName() .. ", it is so good to see you again. I hope my sword has been treating you well. What [" .. eq.say_link("brings me here", false,"brings you here") .. "], friend?");
			if(qglobals["paladin_epic"] == nil) then
				eq.set_global("paladin_epic","1",5,"F"); --Flagged to start epic
			end

		end 
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("brings me here")) then
		e.self:Say("Yes, what is your purpose here? Perhaps you are curious as to how I've gotten here? Would you [" .. eq.say_link("like you to tell me", false,"like me to tell you") .. "]?");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("like you to tell me")) then
		e.self:Say("Let us start at the beginning. I, in my mortal form, was a follower of Quellious. As a young paladin, my tutors early on noticed my talents at spell-casting and my skills as a swordsman. I surpassed all of my mentor's expectations but I still had a [" .. eq.say_link("lot to learn") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("lot to learn")) then
		e.self:Say("My knowledge grew quickly, to the point where I could not learn anymore from my mentors. One day, I was given the choice of learning from a new master, one that rarely teaches knights. To be taught by him, I was given a series of rites that I had to pass. The path was long and difficult, but I was able to [" .. eq.say_link("impress my new master") .. "] and convince him to teach me.");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("new master")) then
		e.self:Say("Oh yes, I apologize if this sounds like boasting, but my master was both impressed and surprised with my progress. He took me as his student. Years later I had gained all the knowledge I could acquire from my master and I was able to craft a great sword, the Fiery Defender. At this point in my life I decided to go on a mission to help people in need, to promote the paladin ideals to those that wished to listen, and spread the word of my Lady Quellious. However, this is not [" .. eq.say_link("where the story ends") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("story ends")) then
		e.self:Say("A few years after I set out on my own, I met a man named Kirak Vil. Despite being a dark elf, I welcomed him as an equal. Though I was cautious, I decided to teach him the ideals of paladins; courage, honor, truth, as well as all of the other ideals that encompass our lives. One day something [" .. eq.say_link("bad happened") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("bad happened")) then
		e.self:Say("Kirak one day turned on me. We set on an expedition deep inside Old Paineel to save a kidnapped child, when a creature named a Thought Tormentor attacked us. Kirak did not help defend me and our small expedition. Last thing I remember before blacking out was a being named the Keeper of the Tombs drawing the life out of me. I [" .. eq.say_link("remember little after that") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("remember")) then
		e.self:Say("I have intermittent memories of being tormented and imprisoned in the Fear plane. I was stripped of my dignity and honor, and all that was left was a shade of my former self. Most of my vivid memories of that time consisted of unbearable flashes of pain. With whatever cognitive thought that remained, I prayed to Quellious to give me strength. That is when you came to my side and [" .. eq.say_link("saved me") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("saved")) then
		e.self:Say("Yes, by giving me the honor of wielding my sword, shield, and armor, I was set free from my torment in that wretched place. I was still not whole, however. I journeyed to many places in Norrath, looking for a place to sacrifice myself upon the spear of pain. I eventually found my way to some of the [" .. eq.say_link("outer Planes") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("outer planes")) then
		e.self:Say("As I stepped foot into the Plane of Tranquility, my soul began to yearn to be complete. This must have been a gift given to me by my Lady Quellious. I ventured into the Plane of Valor and this is when the Lord Mithaniel Marr found me and felt my suffering. I was summoned to the Temple of Marr and upon arrival, I was greeted and welcomed by every knight there. While I commanded respect in my former self, nothing I had ever experience was as intense as this. For the first time after the betrayal, I had felt complete. Lord Mithaniel and his priests gathered around me and chanted for three straight days. What happened next was [" .. eq.say_link("unbelievable") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("unbelievable")) then
		e.self:Say("My soul and the lifeless bones that were my body began to burn like fire. It felt both painful and soothing at the same time. Energy poured out of my body and then a flash of light occurred, I passed out shortly thereafter. During my slumber, the Goddess of Love nurtured my mind and kept me company. I awoke a week later to find myself still in the Temple of Marr. The priests of Marr took care of me during my [" .. eq.say_link("transformation") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("transformation")) then
		e.self:Say("Indeed, Lord Mithaniel endowed me with this body and spoke to me, he said \"My brother, while you are not a follower of Marr, I offer you a place of brotherhood here in the Halls of Honor. Your courage and perseverance are extremely commendable and I would like you to serve in my army.\" Honored by the ascension Lord Mithaniel had given me, I still had to take time to [" .. eq.say_link("consider") .. "] the offer.");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("consider")) then
		e.self:Say("Yes, I was afraid my Lady Quellious would be saddened if I stayed in Mithaniel's realm. So I prayed to her and asked for guidance. My Lady appeared to me in my dreams and praised me for my loyalty. She then gave me approval to serve as a Soldier of Marr and offered me a place in her realm once my services to Lord Mithaniel were over. I was most [" .. eq.say_link("honored") .. "] and grateful at the same time.");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("honored")) then
		e.self:Say("Honored is an understatement. I was overwhelmed by the fact that the god of Valor and Honor chose me to serve in his army. I was also overwhelmed by my own god's offer to serve her after my tour was done in this plane. I try to be very humble about this honor, for that is a virtue held dear to all paladins. Now that my story is over, I [" .. eq.say_link("require something of you") .. "].");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("require something")) then
		e.self:Say("When I ascended to this plane and was transformed, Mithaniel gave me a specific purpose. I was graced with the ability to sense others who were like me, others who were tortured and tormented. I have a sensitivity to other poor beings that have been tormented the same way as me. I would like you to find these beings who were being tortured, and perhaps that may shed some light on my past. I have had a few [" .. eq.say_link("visions") .. "] on what may help you find these other tormented beings.");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("visions")) then
		e.self:Say("I have had visions recently of various beings who have been captured by some foreign minion and tortured. The visions all were similar in nature. Very horrible things were done to these beings, very gruesome things. As the being kept fighting the pain and anguish, more torture was applied to break them...it was a horrible vision. A spell was casted mid-way though this ritual and the tormented being was held in a stasis. I felt a tugging at my soul, and I saw that the being's soul was being pulled from their body. The soul was removed from the being and imprisoned in a crystal of foreign origin. My only guess is that whoever is behind this ploy has been stealing the souls of various races of Norrath for some dark purpose. Help those that are tormented, find the crystals, and this will help you find the minions behind this plot. Go now noble Crusader!");
	elseif(e.other:HasItem(64031) and e.message:findi("tell me about your master")) then
		e.self:Say("Yes, this was my final master, the one who rarely taught knights. You have proven yourself to be a powerful and honorable paladin, and you have surpassed anything I could teach you. You have already met my master once, a very long time ago. His name is Inte Ikera, the noblest servant of Prexus. Go to him now with Redemption in hand so that you can begin your training. Good bye and good luck, friend.");
		eq.set_global("paladin_epic","9",5,"F");
	end		
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(qglobals["paladin_epic"] == "6" and item_lib.check_turn_in(e.trade, {item1 = 69971})) then
		e.self:Emote("I see you have destroyed the monster responsible for this plot. This sword, this twisted piece of steel and blood that lies in your hands, must be the instrument used by Durunal to twist and corrupt those he tortured. I can feel that this sword has a dark magical power that he used to forcibly and violently siphon the soul of those he tormented. There is only one way to correct Durunal's wrong-doings, as well as lay to rest the souls of those he tortured. You must take the crystals you have gathered and meld them with the sword. . .give those tormented souls a new purpose and a new meaning. After you have joined the souls with this weapon, I will [" .. eq.say_link("tell me about your master",false,"tell you about my master") .. "].");
		eq.set_global("paladin_epic","7",5,"F");
		e.other:SummonItem(69972); -- Item: Dark and Twisted Sword
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
