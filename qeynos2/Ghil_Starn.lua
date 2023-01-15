-- items: 13784
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm Ghil.. I used to run a small business before I hooked up with Hanns. Together, we muscled our competition out of Qeynos. But I'm getting too old for the rough stuff anymore, so I just lay low down here and peddle my goods. Anyway, I gotta get back to work and pack up this shipment for ol' [Denny-boy]");
	elseif(e.message:findi("denny")) then
		e.self:Say("Den Magason works for ol' [Captain Rohand] down at the Qeynos docks. I need to find someone to take a [package] to him, so it can be shipped to Erudin.");
	elseif(e.message:findi("captain rohand")) then
		e.self:Say("Captain Rohand runs the Mermaid's Lure and trades goods with the sea merchants from Odus.");
	elseif(e.message:findi("package")) then
		e.self:Say("I need someone to take this package to Den. He'll make sure it goes out on the next ship to Odus. I owe him a small favor, too.. So when you meet up with him, I need you to do whatever you can to help him out. Do a good job.");
		e.other:SummonItem(13784); -- Package for Den
	end
end