function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, %s.  My name is Imkar and I am kind of new at this job but I can give you some advice.  Be careful here in Qeynos.  There are many [dark forces] at work here that are best left undisturbed.",e.other:GetName()));
	elseif(e.message:findi("dark force")) then
		e.self:Say("I really don't know yet.  I just know that chills shoot up and down my spine when I pass certain places on my patrol.  My mother was a gypsy and told me I had the 'gift of sense.'  I think the chills are part of that gift.  Just be careful.  Especially near the entrances to the aqueducts below the city.");
	end
end
