-- items: 18195, 1682, 48132
function event_say(e)
	if(e.other:GetLevel() >= 46 and e.other:Class() == "Monk") then
		local qglobals = eq.get_qglobals(e.other);
		-- monk epic 1.0
		if(e.message:findi("hail")) then
			e.self:Say("Good day, citizen. Please remember to keep your voice down in our library. Feel free to browse the extensive collection of books we have on display. Learning is all about you. Our library is the greatest collection of educational literature in the world, as you can no doubt see. If you come across any [" .. eq.say_link("rare finds") .. "] we may be interested in purchasing them.");
		elseif(e.message:findi("rare find")) then
			e.self:Say("Yes, any rare books, tomes, essays, or other literature you find may be of interest to me. Although the finds I am interested in are quite high profile and would most likely only be found in the possession of very powerful or influential beings. Give me what you find and I will pay you what it is worth to us.");
		elseif(e.message:findi("lheao")) then
			e.self:Say("Lheao was my predecessor here at the library of Erudin. He has since retired, just a few years ago. Im sure he would be most impressed with your find and other insightful conversation on the subject. Although Im not sure one of your profession would be interested in such a scholarly endeavor, no offense. If you are interested, find him and tell him you found the book Immortals. Im not sure where he has retired to, but I hear it is near an ocean somewhere.");
		elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "2" and e.message:findi("power of the immortals")) then
			e.self:Say("Power of the Immortals? Hmmm. . .well of course I know about that, but at the moment I have more pressing issues at hand. I'm sorry I could not be of more help, but maybe after my assistant has returned I can help you.");			
		elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "3" and e.message:findi("disciple of Kaiaren")) then 
			e.self:Say("It is unknown to many that Kaiaren had another student before Vorash. He was a disciple that wanted to learn the true power of mind and body. Sage Kaiaren had so much respect for him that he decided that he was going to take Kaiaren's place among the Order of the Celestial Fists when it was his turn to choose a new member. This disciple's name was [" .. eq.say_link("Vortix") .. "].");
		elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "3" and e.message:findi("vortix")) then
			e.self:Say("When Vortix was training with Kaiaren, he learned many techniques that Vorash never had time to learn because of Kaiaren's suspicions of him. The only soul that may know of these lost disciplines is Vortix. Unfortunately, he went into hiding shortly after Kaiaren's battle with Vorash. He became a coward hiding from the public and began to write himself out of history to live the life of an outcast. If he cannot be found you can also find his [" .. eq.say_link("book") .. "].");
		elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "3" and e.message:findi("book")) then
			e.self:Say("Well I shouldn't say book. It was really a diary of sorts. Kaiaren wrote a diary and it contained all of his disciplines. There may also be a way to reverse the effects of Vorash's attacks located within it. Unfortunately, Vortix would also be the only one that would know the diary's location. Go now and try to locate Vortix and ask him [where Kaiaren's diary] may be. Who referred you to me in the first place? Maybe he knows more than he appears to. I remember that Vortix will only address those that call to him by name.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Good day, citizen. Please remember to keep your voice down in our library. Feel free to browse the extensive collection of books we have on display. Learning is all about you. Our library is the greatest collection of educational literature in the world, as you can no doubt see. Return to me again when you are an experienced monk.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18195}) and e.other:GetLevel() >= 46 and e.other:Class() == "Monk") then
		e.self:Emote("gasps at the sight of the rare book. 'This is a great find indeed! I can only imagine who you had to.. persuade to give you the book. Our library would be very interested in acquiring this and I am prepared to give you this referral that marks you as a friend of the library. If only [" .. eq.say_link("Lheao") .. "] could see this.'");
		e.other:SummonItem(1682); -- Danl's Reference
		e.other:Ding();
	elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "2" and item_lib.check_turn_in(e.trade, {item1 = 48132})) then
		e.self:Say("What's this? How did you know I was missing these pages? I still do not know how you always find a way to help but you have again. Now what is it you came to ask me before? Ah yes, it was regarding the Immortals. It is no coincidence that the pages you just brought me came from the very book you are referring to. Tomekeeper Danl mumbles a few words you do not understand and the pages magically are inserted back into the book and become legible again.");
		e.self:Say("Well I suppose I do owe you the information you had come here seeking. Unfortunately, I do not know much more than what is in this book already. The other references I have found do speak of another [" .. eq.say_link("disciple of Kaiaren") .. "].");	
		eq.set_global("monk_epic","3",5,"F");		
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- End of File
