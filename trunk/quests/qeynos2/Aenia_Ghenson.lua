function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why, hello there!  I'm Aenia, daughter of Dranom.  It's such a bore just sitting around here all day and night.  My father is soooooo overprotective! He never lets me go out and have any fun at all.  And he's so mean to my poor [boyfriend]!");
	elseif(e.message:findi("boyfriend")) then
		e.self:Say("My boyfriend's name is Behroe Dlexon.  He is so dreamy..  <sigh>..  But, I haven't been able to see him lately.  He works nights down at the docks, and with my father here all day, we just can't seem to get together.  Oh, how I wish I could speak with him..");
	elseif(e.message:findi("oh glistening crimson rose, you would be such a catch. oh beautiful thornless rose, your essence has no match")) then
		e.self:Say("Oh..   My Behroe is so sweet.  Oh, how I long to see him.  Please, oh please, kind Kajigger, can you do me but one favor? Here, quickly, before my father returns.  Take this letter to my love, Behroe.  I have no money to offer you, but as you are a friend of his, so are you a friend of mine, and I will not forget your good deeds, Kajigger.  Thank you and be safe.");
		e.other:SummonItem(18027);
	end
end
