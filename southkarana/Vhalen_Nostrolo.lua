-- Winds of Karana
-- Broken Lute
-- items: 13114, 18803, 13116, 13119, 15722, 15717, 77627

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to meet you.  Do not the plains of Karana abound with life?  This land is truly blessed by the gods.  Would you like to [hear a tune] or will you pass up the opportunity?");
	elseif(e.message:findi("hear a tune")) then
		e.self:Say("Inside this heart, I am trapped with the sight of beautiful colors, all memories of your love. They attack me with full might. You left me here in this garden of grey Never to see the true colors of the happiness of day Here in my heart I sit and I cry. You have left me alone and my colors have all died...  What do you think? Is it a [happy tune] or a [sad tune]?");
	elseif(e.message:findi("happy tune")) then
		e.self:Say("It does need work. It should make the listener sad. I fear all my best tunes are behind me. That's why I am here. I am trying to write a [new composition].");
	elseif(e.message:findi("new composition")) then
		e.self:Say("I have come here to create my greatest composition. I call it 'The Winds of Karana.' Alas, the song sheets have been taken from me. While I, ahem, attended to some personal business, a hermit came and stole two song sheets from my pack. It would be grand if, in your journeys, you were to come upon this hermit of the plains and return my song sheets to me. I would pay dearly. Now, I must get back to my thoughts. Please excuse me.");
	elseif(e.message:findi("sad tune")) then
		e.self:Say("It takes a broken heart to truly appreciate that tune. I'm glad you enjoyed it. My dear [Metala] left me one year ago. The wound has healed, but the scar remains. I am presently trying to complete a [new composition]. Maybe that will turn me around.");
	elseif(e.message:findi("Metala")) then
		e.self:Say("My dear sweet Metala Highflit. She was a bard I trained and fell in love with. We were perfect together. We composed many love ballads during those years. I just love the way she used to brush the hair away from her face and to see her in the moonlight brought daylight to my soul . We had such times ! I remember once, we had dinner at the Lion's Mane and we ordered a burrow pie for dessert. She got some whipped cream on her nose! Oh, it was so cute... am I [boring] you or should I tell you [where it went wrong]?");		
	elseif(e.message:findi("boring")) then
		e.self:Say("I understand. I must find a way to lift my spirits so that my audience will also be uplifted. I'm sure my new composition will help me overcome this sadness.");
	elseif(e.message:findi("where it went wrong")) then
		e.self:Say("It was like that for years and then it all just ended. She began to hang around some man called Garuc Anehm. She started attending evening functions. She said it was choir practice for the Temple of Life. Do you want to know [what I found out], or am I [boring] you?");
	elseif(e.message:findi("what I found out")) then
		e.self:Say("Feeling neglected, I also went to join the choir. To my shock, I learned from High Priestess Jahnda that Metala was never in the choir. When I mentioned that fellow Garuc's name, she gave me a dirty look and would say nothing further.  I must be boring you. You don't want to [hear the end]...");	
	elseif(e.message:findi("hear the end")) then
		e.self:Say("I went home to confront Metala.  All I found was an empty house and a note. 'Sorry to leave. Thank you for all you have taught me. My new friends have shown me new paths of pain. My music shall sing for a new generation of bard. Goodbye.' <sigh> I never saw her again . Whatever she has started is twisted and contorted. It is not the music of the soul. She must be stopped before it is too late. Please go! I cannot speak of this further.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);

	if(item_lib.check_turn_in(e.trade, {item1 = 13114})) then -- Lisera Lute
		e.self:Say("Ahh, I see Cassius still don't trust his lute to anyone else. Please be kind to return this letter to him about his lute. It should make him quite pleased.");
		e.other:SummonItem(18803); -- Note To Cassius
		e.other:Ding();
		e.other:Faction(262,2,0); -- Guards of Qeynos
		e.other:Faction(281,2,0); -- Knights of Truth
		e.other:Faction(284,2,0); -- League of Antonican Bards
		e.other:Faction(230,-5,0); -- Corrupt Qeynos Guards
		e.other:Faction(330,-5,0); -- Freeport Militia
		e.other:AddEXP(5000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13116,item2 = 13119})) then -- Winds of Karana sheet 1, Winds of Karana sheet 2
		e.self:Say("Thank you, my friend. I have just completed the composition. It is a work of art. Here. Have a copy. I hope you have the musical talent required to play it. If not.. Practice, practice, practice!");
		e.other:SummonItem(eq.ChooseRandom(15722,15717)); -- Song: Jaxan's Jig o' Vigor or Song: Selo's Accelerando 
		e.other:Ding();
		e.other:Faction(284,2,0); -- League of Antonican Bards
		e.other:Faction(281,2,0); -- Knights of Truth
		e.other:Faction(262,2,0); -- Guards of Qeynos
		e.other:Faction(304,-5,0); -- Ring of scale
		e.other:Faction(230,-5,0); -- Mayong Mistmoore
		e.other:AddEXP(5000);
		e.other:GiveCash(5,0,0,0);
	elseif(qglobals["bard15"] == "5" and item_lib.check_turn_in(e.trade, {item1= 77627})) then -- Note from Metala, bard 1.5
		e.self:Say("No this can't be true! Metala must have been kidnapped and forced to sign this letter!  You must find her and save her, " .. e.other:GetName() .. "! Please!  Take this necklace; it was a gift she gave me on our anniversary long ago.  Surely it will help her remember her true self and make her come to her senses.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 77629, 1); -- Vhalen's Necklace
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE zone:southkarana ID:14058 -- Vhalen_Nostrolo.pl
