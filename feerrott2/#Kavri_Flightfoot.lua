function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, if it isn't the renowned ".. e.other:GetName() .."! Vasha! I was hoping I'd get a chance to meet you. It's an honor. A great, great honor.' She stretches out her hand to meet yours. 'In case you're curious about what I'm doing here, I'm actually gathering materials from the [".. eq.say_link("wolves") .."] and [".. eq.say_link("spiders") .."] in the area, as the material is very strong and good for my projects.  Although, I'm sure you've more heroic things to do...");
	elseif(e.message:findi("wolves")) then
		e.self:Say("The wolves, that is the tanglefang wolves of the Feerrott, have a very strong hide that can be extremely easy to work.  It works equally well for making armor and bedspreads.  Oddly enough, these pelts are far superior to bovine and bear pelts once we discovered how to treat them.  Would you be [".. eq.say_link("willing to get") .."] a few fine pelts for me?  If it's not too much to ask, that is.");
	elseif(e.message:findi("willing to get")) then	
		--You have been assigned the task 'Tangling With Wolves'.
		e.self:Say("Karui.  Having a person of your stature help me with this is quite humbling.  I hope to see you soon, then.  Udra, friend!");
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	elseif(e.message:findi("spiders")) then	
		e.self:Say("There is a specific type of spider, the orbweaver spiders, that have extremely strong silk webbing.  Cloth as protective as steel if properly worked.  I hate to ask, but [".. eq.say_link("would") .."] you mind getting some silks from the orbweavers for me?");
	elseif(e.message:findi("would")) then	
		--You have been assigned the task 'A Strong Silk'.
		e.self:Say("Karui.  Having a person of your stature help me with this is quite humbling.  I hope to see you soon, then.  Udra, friend!");
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	end
end