function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail. %s!  Good to see ya!  Welcome to Qeynos!  My name is Gehnus Torris.  If you are looking to do some trading. I would steer clear of that Tubal fellow.  He is from Highpass Hold and they are well known for taking advantage of travelers.",e.other:GetName()));
	end
end
