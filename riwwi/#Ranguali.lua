function event_say(e)
    if(e.message:findi("hail")) then
		e.self:Emote("squints and stares as if sizing you up. Another adventurer come to the coliseum looking for fame and glory? Hmph. You have no idea what you're up against. [Taskmistress Krisz] would destroy you in the blink of an eye. She keeps the slaves here in line and she keeps the Legion of Mata Muram in line. Only a fool would dare to even look at her wrong, much less incur her wrath.");
    elseif(e.message:findi("taskmistress krisz")) then
		e.self:Say("Did you not hear a word I said? She's dangerous beyond your wildest imagination. I've seen her cut a man in half with a single swing.' He shrugs and continues, 'If by some chance you're several orders of magnitude more powerful than the other imbeciles that faced her and failed, come speak with me after you've defeated Krisz. There are [rewards] to be had for besting the Taskmistress and I've made it my business to learn all about them.");
    elseif(e.message:findi("reward")) then
	    if(e.other:HasItem(52133)) then --fur of taskmistress krisz
	        e.self:Say("Well now. I see you recovered a section of the Taskmistress's fur. She always did pride herself on the sheen of her coat.' He nods and continues, 'You can take advantage of her grooming habits by sewing together a bag from the fur. Unfortunately there's not enough here to work with. You would need four more lengths of Pristine Ixt Fur.");
	    elseif(e.other:HasItem(52119)) then --taskmistress krisz's head
          e.self:Say("Yes, that is exactly what I wanted to see. The head of Taskmistress Krisz herself. There's bound to be someone out there that would reward you handsomely for this grisly trophy. She made an awful lot of enemies. Keep your eyes open.");
      elseif(e.other:HasItem(52116)) then --hilt of a snapped blade
	        e.self:Say("Incredible work, ".. e.other:GetCleanName() ..". You did it! I wish I could have seen the look on her face when she died. Now, what you have here is half of a legendary weapon called Equifinis. All you need to do is locate the other half and reforge the blade. The hilt should merge with its missing half easily when heated over the coals of a forge.");
      elseif(e.other:HasItem(52118)) then --block of jade-flecked clay
	        e.self:Say("And what's this, ".. e.other:GetCleanName() .."? A block of special clay that you wrested from Krisz. It's magical, obviously. Even a novice potter could sculpt with the clay if they had the right sketch to work from. Hmm. Assuming you located such a sketch, it would only require water and sculpting tools to finish the job.");
        else
            e.self:Emote("looks at you quizzically. You . . . have to kill her first. You realize this? Come back to me if and ONLY if you've killed Krisz and have something to show for it. Otherwise, don't waste my time.");
        end
    end
end
