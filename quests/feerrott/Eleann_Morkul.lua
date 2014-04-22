function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome friend. you're a great leap from any sort of civilization.  What brings you to this foul place? Are you an adventurer or just a connoisseur of wretched foliage and damp clothing?");
	elseif(e.message:findi("adventurer")) then
		e.self:Say("Well. I gathered as much. but I try to avoid assumptions.  Are you by chance heading to the temple?  It seems to be quite a draw for adventurers and academics alike.  Though we've yet to witness either group leave the structure once they've entered it.");
	elseif(e.message:findi("to the temple")) then
		e.self:Say("Well. take care and prepare for the most horrific of possibilities. my friend.  Our trip has been terrifying enough and we've yet to enter the temple itself.  I've seen enough from here to confirm some of the rumors that we were sent to investigate.");
	elseif(e.message:findi("rumors")) then
		e.self:Say("The Academy sent my colleagues and I to investigate several reports about Tae Ew tribal activity that have found their way to Freeport during the course of the last lunar cycle.  The rumors stated that the primitive creatures have made several great discoveries of a necromantic nature in an incredibly short time.  I was assigned to gather any artifacts and information that I could uncover.  If you should learn more about their magic. please return to me before we leave and you will be rewarded.");
	elseif(e.message:findi("magic")) then
		e.self:Say("The Tae Ew have never been brilliant. but their capability for magic use has always existed.  It was shocking to learn that they have been reported to have opened portals to Planes of existence outside of our own.  The Tae Ew have also begun to display a metamorphic progression as well.  Given the rate at which these changes have occurred. we can only assume that they are being directed by a will greater than their own.");
	elseif(e.message:findi("connoisseur")) then
		e.self:Say("Well. enjoy yourself.  I know that I've had quite enough of it myself.");
	elseif(e.message:findi("what temple")) then
		e.self:Say("The temple of the lizardmen.  The lost temple of Cazic-thule. It's just to the east of here... across the river.");
	end
end

-- END of FILE Zone:feerrott  ID:47131 -- Eleann_Morkul