--Zone: South Karana
--Short Name: southkarana
--Zone ID: 14
--
--NPC Name: Baenar Swiftsong
--NPC ID: 14046
--Quest Status: finished
-- Updated by Kilelen

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please, I am trying to work here. If you bother me I will write a horrible song about you and sing it from the mountain tops!");
	elseif(e.message:findi("request")) then
		e.self:Say("You have no request for me? How odd. Well, then. Perhaps a tale of [history] will do?");
	elseif(e.message:findi("history")) then
		e.self:Emote("strums his lute and clears his throat. 'Here is a tale of the place of torment from which souls good and bad have come to call home upon this earthly [realm].'");
	elseif(e.message:findi("realm")) then
		e.self:Say("The place I speak of is the Estate of Unrest. It is a place that the dead roam and the living detest. Garanel Rucksif was his name, a name that no longer came to be . A name that Quellious herself saw fit not to let anyone see, for a cleric loyal to her called the lands home. Open to all, the Fier'Dal, Koada'Dal and even the occasional [gnome].");
	elseif(e.message:findi("gnome")) then
		e.self:Say("A mansion built by the cleric with care, for he came to spread the word of Quellious to Faydwer. Garanel mad with rage, killed his wife and children three. From his dwarven homelands he now will flee. Upon this place of tranquility he stumbled upon. He tortured and killed the cleric and his kin by morning's dawn. Within the sacred chapel walls the bloodshed took place. Eyes wild with rage, madness and blood upon his [face].");
	elseif(e.message:findi("face")) then
		e.self:Say("Quellious, enraged by this act of violence and murder, decreed that this would continue no further! Garanel was struck down, his soul cursed forever more, to haunt the grounds of the defiled estate, guarding its bloody floor. Undead monsters, ghosts and [ghouls] slaughter all those who stray. They say his undead power grows within him to this day. This sad tale, my friends, is the Legend of Unrest.");
	elseif(e.message:findi("ghouls")) then
		e.self:Say("I've even heard of the ghosts of poor children haunting the estate. Have you ever [seen a child's ghost]?");
	elseif(e.message:findi("seen a child's ghost")) then
		e.self:Say("You have? Did it speak to you?  What did it say?  Only the essences of those unjustly wronged or the vilest of souls are bound to this realm and sometimes end up in that accursed place.  Only that which binds them to this realm may set them free.   Curse those who would harm an innocent child!  I knew of one such unfortunate child.  I was to bring her a [doll] for her birthday but she fell to a thieving cutthroat's sword!'  Baenar's eyes fill with tears.  'Pardon me, friends, she was like a daughter to me.  I loved her as I would my own!");
	elseif(e.message:findi("doll")) then
		e.self:Say("What's that you say? You wish to have the doll I was to give her? Whatever for? Bah! Nevermind me. I rant like an old woman sometimes. I should let her memory go but I would stop my heart from beating before I forget that child. Here, take this invoice. I have no further use for it. Give it to Marfen Binkdirple.");
		e.other:SummonItem(20372); -- Solusek Mining Company Invoice
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20373})) then
		e.self:Say("So, Belious Naliedin sent you, eh?' Baenar shakes his head. 'I hope your letter of introduction did not empty your purse. You have the audience you seek. What is your [request]? A song perhaps? To immortalize your heroic deeds in song? How about an epic battle with a gnoll pup? I'll make you famous.");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20371})) then
		e.self:Say("A note from the child? How can that be! How could she know I was her father? Unless? Cyrah told her. Forgive me. Cyrah was the name of the woman to whom I was betrothed. Unfortunately her parents forbade her from marrying a lowly bard such as myself. Her father married her off to a young merchant in Qeynos named Maligar. She married him only out of respect to her father. Her heart was truly mine, at least, so she always said. When Serra was born, I visited them both often. She was like no other, so innocent and sweet. In those few years I watched her grow up to be more and more like her mother and I saw none of the father in her appearance. I do not like Maligar, but the least we can do is inform him of his child's death. I saw his caravan pass by not more than a day ago headed to Qeynos.");
		e.other:SummonItem(20368);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20367})) then
		e.self:Say("That vile dog! I knew there was something not right with him, the way he stared at everyone with contempt! Even his own wife! I curse him! I curse him to stay upon the realm and deny him what he most desires! This is too much! I cannot play or write this day. The sadness overwhelms me. In honor of Serra, the daughter that was denied to me in spirit, I vow never to play this instrument again! It was her favorite and she listened to me play for hours on end. Here take it! Take it out of my sight! Leave me be with my grief and my loss.");
		e.other:SummonItem(20366);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:southkarana  ID:14046 -- Baenar_Swiftsong