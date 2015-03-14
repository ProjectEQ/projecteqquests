function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello. %s.  My name is Hezlan Nur and I am a member of the Qeynos Guard. serving the will of Antonius Bayle.  Anything or anyone trying to get into Qeynos has to go through me. first.  Heh!  I sure love it when those dirty Sabertooths try. though!  Nothing is as gratifying as the death wail of a gnoll.",e.other:GetName()));
	end
end

function event_signal(e)
		e.self:Say("It isn't safe to be asking that kind of question. I just mind my business and do my job. You would, too, if you knew what was good for you.");
end
