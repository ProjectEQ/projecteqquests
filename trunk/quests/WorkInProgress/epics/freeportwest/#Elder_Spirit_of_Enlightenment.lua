--freeportwest/Elder_Spirit_of_Enlightenment.lua NPCID 383145
--Shaman Epic 1.5, 2.0 and Prequest
local count = 0;

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:Class() == "Shaman") then
		if(e.other:HasItem(41000) or qglobals["shaman_pre"] == "3") then --Have the Spear of Fate (41000) or finished prequest
			if(e.message:findi("hail")) then
				e.self:Emote("eyes you with an ageless wisdom.");
				e.self:Say("Ah, your spirit shines brightly. Should I know you?");
			elseif(e.message:findi("shaman")) then
				e.self:Say("Ah, yes. You are not only a shaman, but one who has passed the tests of the heyokah. There are many problems that face us now and I grow weaker by the day. If you feel you are ready to bear a great burden and help all of those like us, including the immortals that charge our essence and consciousness, say [it is so].");
				if(qglobals["shaman_epic"] == nil) then
					eq.set_global("shaman_epic","1",5,"F"); --Flagged to start epic
				end
			end
		else --Dont have the Spear of Fate and haven't completed Prequest
			if(e.message:findi("hail")) then
				e.self:Say("It Appears you are not yet ready for the great tasks that I require to be done. There are Others lesser than me that can guide you and prepare you to walk a greater path should you choose. You should seek them out. You can Perhaps seek knowledge from your elders and peers.");
				if(qglobals["shaman_pre"] == nil) then
					eq.set_global("shaman_pre","1",5,"F"); --Flagged to start Prequest
				end
			end	
		end
		if(e.message:findi("it is so") and qglobals["shaman_epic"] == "1") then
			e.self:Say("To have you here, believing in us and our existence does give me warmth, but my length of time here and others like me may be at an end. The spirits are troubled and a darkness washes through our existence that we seem helpless to prevent. That is why I talk to you now -- to help us. Without the help of mortals, we may [blow away] with the winds.");	
		elseif(e.message:findi("blow away") and qglobals["shaman_epic"] == "1") then
			e.self:Say("You have heard of the darkness in Taelosia that came from another place. You may have even seen the world that is overshadowed by the dark influence of Discord. That seeping ill that is not touchable by claw or paw has wormed its way into the [streams of the spirit world] and the more it does, the more we, and I weaken.");
		elseif(e.message:findi("streams of the spirit world") and qglobals["shaman_epic"] == "1") then
			e.self:Say("Yes, it is true. I feel myself fading more with each turn of time. You are familiar with the ways of herbs and potions and you can aid me, should you [find the will]. With strength to keep me before you in the mortal realm, I can guide you so that you may aid us all. There is much to tell you that I will not reveal yet, lest you be tempted to take advantage -- which has happened before.");
		elseif(e.message:findi("find the will") and qglobals["shaman_epic"] == "1") then
			e.self:Say("Very well. You will not find this an easy task. There are several things you must do and other heyokah you must find that have helped us in the past. Where there is glitter upon the setting of Ro, you will find an agent of the spirits. In the deep waters where the megalodon is said to hunt, there is another. And where the wonders of nature rise in the dark, another ally awaits. Look for light in the denseness of entwined shadows. One will greet you with all you have learned. She is doing research in a bustling labyrinth of creatures and can educate you where I cannot. Tell them all of me and they will give you audience");
		elseif(e.message:findi("wasichu") and qglobals["shaman_epic"] == "2") then
			e.self:Say("The wasichu are those that turn their backs on serving the spirit world for its own sake. They hunger for their wn power. At greater risk now are the spirits of Wisdom and Patience. They have become weakened and their fading is eroding what you as shaman often rely upon. The Spirit of Might has lost its way altogether and has crossed over into the darkness of Discord in that other realm. It has veen mobing amongst the [dark creatures] there, using its influence to guide and move some beasts in strange ways.");
		elseif(e.message:findi("dark creatures") and qglobals["shaman_epic"] == "2") then
			e.self:Say("We must prepare a [ritual] that has not been performed in many, many years. We hope this one ritual will return the strength of the failing spirits and restore the honor and humility of the Spirit of Might, but there is much preparation to be done. If you are prepared to take on this task, I will tell you what I know. This is no small endeavor, friend. Your mind and body and your strngth of spirit will be put to the test.");
		elseif(e.message:findi("ritual") and qglobals["shaman_epic"] == "2") then	
			e.self:Say("The ritual we need to perform is an ancient one, called Ruchu, and it will require a lot of preparation and planning on our parts. To begin with, we need to call upon our allies for help. One thing we need is spirit talismans. In times past, the spirits bestowed very powerful talismans upon a few, but [great] heyokah. We are going to need some of them to perform this ritual as they contain some of the essence of the very beings we are tying to save.");
		elseif(e.message:findi("great heyokah") and qglobals["shaman_epic"] == "2") then
			e.self:Say("One of them was a [wise] shaman who once walked the lands and gahered every morsel of wisfom his mind could consume in the ways of alchemy and magic. Even though he was a froglok, he was incrediby gifted. His name was Juktopp Gantroc. Though he was small in stature, his knoledge seemed and endless expanse.");
		elseif(e.message:findi("wise") and qglobals["shaman_epic"] == "2") then
			e.self:Say("We had [watched] him and were amazed by the depth and breadth of his knowledge and how he applied it to his arts. Over time, he began to learn things that we did not know or piece together ourselves, adding great value to the spirits and shaman everywhere.");
		elseif(e.message:findi("watched") and qglobals["shaman_epic"] == "2") then
			e.self:Say("Upon his death, which he made no attempts to prevent and he likely could have, he accepted the passage from the confines of flesh into the spirit world with great grace and dignity. Several of us spirits gathered that night and chose to appear to him and offer him a [rare gift]... a place among the everlasting spirits where he could share his knowledge and continue to learn.");
		elseif(e.message:findi("rare gift") and qglobals["shaman_epic"] == "2") then
			e.self:Say("The Spirit of Wisdom itself blessed a talisman and gave it to Juktopp, telling him of our offer. Needless to say, he was overwhelmed and overjoyed. To this day, he remains light as air and just as free in a planar realm of great beauty. You must find him and retrieve the talisman. Give him this potion whihc will sustain him while we prepare for Ruchu. There is [still more] you must do.");
			e.other:SummonItem(57081); --Potion of Sustenance
		elseif(e.message:findi("still more") and qglobals["shaman_epic"] == "2") then
			e.self:Say("When the gods were still young and the ethereal planes were not much more than imagination, the Tribunal wished to create an infallible system of justice. They also wanted those who approached them to hear or plead their casr to have their resolve tested so the Tribunal's time would not be wasted. Thus, the Tribunal chose to create [trials of justice] so that Norrathians would be required to prove thier worth to have thier case heard.");
		elseif(e.message:findi("trials of justice") and qglobals["shaman_epic"] == "2") then
			e.self:Say("But it was not that simple. It did take some time to decide how the trials would be created so that they were fair and just and would provide a good test of strength and might. There was a high shaman of halas who followed th path lain by the Tribunal and lived his life according to law and justice. His name was [Veshtaq] MacDunahon.");
		elseif(e.message:findi("veshtaq") and qglobals["shaman_epic"] == "2") then
			e.self:Say("Veshtaq's strict asherence to justice eventually earned the attention of the Tribunal and he was asked to ascend from the mortal realm to aid them in creating trials that would be suitable to place before Norathians wishing to approach the greatness of the Tribunal. Of course, Veshtaq obliged and [succeeded] in creating a series of trials that allowed Norrathians to prove thier worth.");
		elseif(e.message:findi("succeeded") and qglobals["shaman_epic"] == "2") then
			e.self:Say("When his work was done, Veshtaq suddenly realized that he had grown much olde and his time in the lane had weakened his ties with the natual spirits of the world. This [troubled] him greatly. He felt his life perhaps had come to no real meaning.");
		elseif(e.message:findi("troubled") and qglobals["shaman_epic"] == "2") then
			e.self:Say("Somehow, the Tribunal then became aware of Veshtaq's concerns and passed a judgment -- that Ceshtaq be granted a place among the trials he created, becoming immortal. With that judgment, the Tribunal had contacted one of the great spirits, that of Patience, and asked for a [meaningful way] for a shaman to become immortal.");
		elseif(e.message:findi("meaningful way") and qglobals["shaman_epic"] == "2") then
			e.self:Say("or a shaman, a blessing of etenal life from any spirit is an honor, so a talisman was created by the Spirit of Patience to sustain Veshtaq for all time and he would be once again be rejoined with the spirit world. Now, Mwinda, it is up to you to retrieve the talisman. You may not simply ask for it. You will have to complete the ery tial he commands and defeat his essence. Do not fret. The Tribunal will sustain him in that plane so he may continue his work.");
		elseif(e.message:findi("stolen") and qglobals["shaman_epic"] == "3") then
			e.self:Say("Very well. You will need to return to Wunshi for more information. He will be able to lead you to some of what we need if you ask him. Return to me and tell me when your business with Wunshi is finished. I am too tired to continue.");
		elseif(e.message:findi("business with Wunshi is finished") and qglobals["shaman_epic"] == "4") then
			e.self:Say("Is that so? I am both grateful and anxious. My sight into the spirit world grows darker with each hour. You have done well, but I am ever fearful that we are not moving quickly enough. You must use all of your skills for your next task. Return to Kimm McShannel and when you return to me, tell me that you have created the potion. Show her this bangle.");
			e.other:SummonItem(57088); --Gemmed Bangle of Enlightenment
		elseif(e.message:findi("take part") and qglobals["shaman_epic"] == "6") then
			e.self:Say("We are still a long way from that, but I feel it is time to [acknowledge] you as a true shaman spirit that has earned the respect of many spirits of the world.");
		elseif(e.message:findi("acknowledge") and qglobals["shaman_epic"] == "6") then
			e.self:Say("We, the spirits, have chosen to grant you a gift for all that you've done for us and what you still have left to do. It is just a sampling of the power you may obtain one day as you move forward as one of the heyokah. Guard it and use it well. Should you choose to continue your journey, tell me that you are [prepared to carry on] and save the spirits.");
			e.other:SummonItem(57400); -- Crafted Talisman of Fates (Epic 1.5)
			--5 AAs
			--Title Fateseer
			eq.set_global("shaman_epic","7",5,"F");
		elseif(e.message:findi("prepared to carry on") and e.other:HasItem(57400)) then
			e.self:Say("I knew we could count on you," .. e.other:GetName() .. "The time for Ruchu is drawing ever nearer, but we still must gather some essential elements. Soon, you will have to cross the barrier into that realm of Discord. Lupot Nukla can help you.");
			if(qglobals["shaman_epic"] < "7" or qglobals["shaman_epic"] == nil) then
				eq.set_global("shaman_epic","7",5,"F");
			end
		elseif(e.message:findi("discord") and qglobals["shaman_epic"] == "9") then
			e.self:Say("We know the Spirit of Might is beginning to disperse not just in Norrath, but that place shadowed by Discord as well. The spirit has passed through many beasts and is corrupting them, each one commanded by a trace of the spirit. You must find several beasts and find those traces of the wasichu. One is an airy, fluid creature. Yet another is a fierce beast that has grown beyond all normal proportions because of the spirit of Might. You must find them. And there are still others you must [seek].");
		elseif(e.message:findi("seek") and qglobals["shaman_epic"] == "9") then	
			e.self:Say("The other creature you must find is a soldier of evil. Another is an scurrying creature that is not bound to our realm. You have much ahead of you. Take this pouch and carefully piece together everything you find and return it to me. You will know how to do it. The spirits will guide you.");
			e.other:SummonItem(57710); --Pouch of Spirit Dust
		elseif(e.message:findi("spiritcaller") and qglobals["shaman_epic"] == "10") then
			e.self:Say("The fiend that is consuming our spirits is in Discord and is siphoning what little energy and strength we have remaining. We are losing ourselves in the passage of Discord. Without the spirits of Might, Patience, and Wisdom, we may not [survive]. We are not whole without them.");
		elseif(e.message:findi("survive") and qglobals["shaman_epic"] == "10") then
			e.self:Say("Make your way to a place of great suffering and death in Kuua. You will need to investigate to help us learn more about our waning spirits. We have no influence there and it is a wholly unpredictable place.");
		elseif(e.message:findi("prepared for the ceremony") and qglobals["shaman_epic"] == "12") then
			e.self:Say("Follow me closely. We must gather the spirits and try to call our ethereal kin of Might, Patience, and Wisdom. The other spirits will join us for Ruchu, namely the Spirit of Perseverance, Spirit of Understanding, Spirit of Fortitude, Spirit of Will, and the Spirit of Sense.");
			--eq.spawn2( ,0,0, , , , );	--#Elder Spirit of Perseverance 
			--eq.spawn2( ,0,0, , , , ); --#Elder Spirit of Understanding
			--eq.spawn2( ,0,0, , , , ); --#Elder Spirit of Fortitude
			--eq.spawn2( ,0,0, , , , ); --#Elder Spirit of Will
			--eq.spawn2( ,0,0, , , , ); --#Elder Spirit of Sense
			--walks somewhere, when he arrives
			e.self:Say("It is time to begin the Ruchu. Collect your strength and let us begin.");
			eq.set_timer("1",2000);
		elseif(e.message:findi("faithful heyokah") and qglobals["shaman_epic"] == "12") then
			e.self:Say("Well, then, the time has come. Give me your Crafted Talisman of Fates, heyokah. Should you not have it now, give it to me when you do. If you have lost it, tell me so. I may be able to help you.");	
		end
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 52921}) and qglobals["shaman_epic"] == "1") then --hand in the Distilled Potion of Endurance (Received from Wilslik Gissu on the previous step)
		e.self:Emote("drinks the potion hastily and shudders. Its essence grows brighter and it's dull eyes begin to sparkle with renewed strength.");
		e.self:Say("You have bought me time -- time to explain how you may aid us all. The darkness of Discord seeps ever deeper into Norrath and the spirit world. Some of the most revered and oldest spirits known have turned to grim pursuits, becoming the [wasichu] -- those creatures you may remember from you time conversing with another great spirit.");
		eq.set_global("shaman_epic","2",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57083, item2 = 57084}) and qglobals["shaman_epic"] == "2") then --hand in Talisman of Patience (drops from  Punisher Veshtaq in POJ Trial of Torture, which needs to be added) and Talisman of Wisdom (from Eternal Spirit in PoSky in exchange for Potion of Sustenance)
		e.self:Say("This is a start. There is still much to do. While we have gotten the talismans from our allies, there are those that are not our friends -- the wasichu and worse -- who carry or have [stolen] items we need. They will not part with them willingly. This is where your strength and might will be put to the test . . . and your presence of mind. Are you certain you wish to go on?");
		eq.set_global("shaman_epic","3",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57614}) and qglobals["shaman_epic"] == "5") then --hand in Runed Purse of the McShannels
		e.self:Say("I will have to pass these along as soon as my messenger gets here. I'm sure you understand that as each spirit loses strength, each of our abilities to keep a form in this tangible world becomes very difficult. We must find a way to sustain a physical presence here or the Ruchu will be in jeopardy. We will ask you to [take part] in the ceremony where our strength may fail us.");
		eq.set_global("shaman_epic","6",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57551}) and qglobals["shaman_epic"] == "8") then --hand in Impervious Medicine Bag (received from Lupot Nukla in Fungus Grove)
		e.self:Say("You never cease to surprise me. I felt in my heart that you would get this far, but I did not expect you to be so bold and steady with your advance. Can you feel the spirits smiling on you?' The spirit lifts its weary head and closes its eyes . . . Yes, yes, they are pleased, but they are weak just as I am. And now the path grows dark and dreary. We must ask you to once again to risk your life, but not in this world, but the world of [Discord].");
		eq.set_global("shaman_epic","9",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57987}) and qglobals["shaman_epic"] == "9") then --hand in Glowing Spirit Charm of Might (made from combine, probably needs added to db)
		e.self:Say("The time is nearly here! We have only a few remaining pieces that we must collect in order to restore our spirits. We did miss something, however, and it must be stopped. You must gather your allies and return to Discord. A wasichu has learned to summon the fiercest beasts and has grown out of control. It is now a [spiritcaller] who is drawing the strength of our most precious elders to do it.");
		eq.set_global("shaman_epic","10",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57404}) and qglobals["shaman_epic"] == "10") then --hand in Spiritcaller Beads (looted from Discordling Spiritcaller in Walls of Slaughter)
		e.self:Say("There is one last thing you must do. Your defeat of the spiritcaller has proven your strength and I believe you are ready. Do not fail us now. You must go into the lair of Mata Muram himself. There is a strange orb that only exists there. We believe some of our spirits, beyond those we shall restore with Ruchu, are becoming absorbed or attracted to these orbs. You must find one and bring it to me and then we shall have all we need.");
		eq.set_global("shaman_epic","11",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 47100}) and qglobals["shaman_epic"] == "11") then --hand in Globe of Discordant Energy (from Citadel of Anguish)
		e.self:Emote("lowers its head and you believe you see a shade of a tear drop from its eyes and disappear into nothingness.");
		e.self:Say("You have done it. You cannot imagine our gratitude. The time for Ruchu is at hand and we offer you the privilege of taking part. If you are able to do the ceremony now, tell me you are [prepared for the ceremony].");
		eq.set_global("shaman_epic","12",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57400}) and qglobals["shaman_epic"] == "12") then --hand in Crafted Talisman of Fates (Epic 1.5)
		e.self:Say("You have heard the stories of the blessings bestowed on some of Norrath's most faithful to the ways of the heyokah. To reward you for all that you've done, the spirits have chosen to bless this talisman and offer it to you as our thanks, for without you, all shaman would have suffered without our presence in this realm. Walk proud, heyokah, and never forget what you are.' All around you, you feel the strength of the spirit world begin to strengthen as the spirit leaves to tend to his wounded companions.");
		e.other:SummonItem(57405); --Blessed Spiritstaff of the Heyokah (Epic 2.0)
		--10 AAs
		--Title Spiritwalker
		eq.set_global("shaman_epic","13",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end

function event_timer(e)
	if(count == "0") then
		e.other:Message(0,"You recognize that the spirits hold items you've retrieved -- crafted totems, the necklace, beads. ");
	elseif(count == "1") then
		e.other:Message(0,"The spirits all howl, creating a resonance that shakes the ground around you. ");
	elseif(count == "2") then	
		--eq.signal( ,1); --#Elder Spirit of Perseverance
	elseif(count ==	"3") then
		e.self:Say("We bring the sum of our strength to you, our Spirit of Wisdom. Hear our call and draw from our offerings of strength. We need you if we are to ever overcome the evil presence that seeps into our consciousness.");
	elseif(count == "4") then	
		--eq.signal( ,1); --#Elder Spirit of Understanding
	elseif(count == "5") then	
		e.other:Message(0,"The spirits begin to chant in unison in a language no Norrathian understands, but you only hear it in your mind. 'Ruchu immana kiratu. Ruchu immana kiratu.'");
	elseif(count == "6") then	
		e.other:Message(0,"As the magic fades, the Spirit of Wisdom lies inside the circle, dazed and confused.");
		--eq.spawn2( ,0,0, , , , ); --#Elder Spirit of Wisdom
	elseif(count == "7") then	
		e.other:Message(0,"The spirits continue to chant.");
	elseif(count == "9") then	
		e.other:Message(0,"This time, the Spirit of Patience appears from the ether, looking tired, but bright-eyed.");
		--eq.spawn2( ,0,0, , , , ); --#Elder Spirit of Patience
	elseif(count == "10") then	
		--eq.signal( ,1); --#Elder Spirit of Wisdom
	elseif(count == "11") then	
		e.other:Message(0,"The chanting of the spirits grow louder, their furry brows furrowed as they focus, trying to call the Spirit of Might out of the shadows of Discord.");
	elseif(count == "12") then	
		e.other:Message(0,"Magic sparks out of the air, revealing nothing. The chanting still echoes in your mind.");
	elseif(count == "13") then	
		e.other:Message(0,"The Spirit of Might appears and disappears, enable to keep a hold in this realm. You hear: 'It has its grip on me. You must let me go.'");
	elseif(count == "15") then	
		e.other:Message(0,"The spirits respond by chanting louder. The rattling of talisman beads fills the air.");
	elseif(count == "16") then
		e.other:Message(0,"Finally, the Spirit of Might appears, its essence is faded and it is so weak it barely keeps a hold on its own existence.");
		--eq.spawn2( ,0,0, , , , ); --#Elder Spirit of Might
	elseif(count == "17") then	
		e.other:Message(0,"The spirits slow their chanting and then there is silence. ");
	elseif(count == "18") then	
		--eq.signal( ,1); --#Elder Spirit of Might
	elseif(count == "19") then	
		e.self:Say("You are not to blame. The voice of Discord is becoming deafening in Norrath. This heyokah has done right by all of us and should be suitably rewarded.' The spirits all nod in thanks as they prepare to quickly take the returned spirits back to their ethereal existence to strengthen them.");
	elseif(count == "20") then	
		e.self:Say("Come to me shaman and state to me that you are, indeed, a [faithful heyokah].");
		eq.stop_timer(1);
	end	
	count = count + 1;
end