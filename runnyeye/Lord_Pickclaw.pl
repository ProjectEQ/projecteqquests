sub EVENT_SAY
	{
	if($text=~/hail/i)
		{
		quest::say("Hail? You should be on your knees, Runjoerun! I suffer you in my realm for the moment, but if you and yours keep on with your attempts to destroy us, this will change. Do not think for a second that my subjects will hesitate to do what I command. I have proven myself in battle time and time again, and will do what is needed in the future. [Xorbb] learned this the hard way, and I am ready to teach this lesson to anyone else who challenges me.");
		}
	elsif($text=~/Xorbb/i)
		{
		quest::say("Surely you know of Xorbb? The leader of the evil eyes, his home is in Beholder Gorge, which he calls his own. That will soon change. We drove him out of our ancestral home here, and we will drive him out of 'his' gorge as well. We shall not forget what he subjected us to, his foul minions controlling the very thoughts of our people, enslaving us to his bidding. But he is weak now, weaker than ever before, and we will take advantage of this weakness. Mark my words, the gorge will be cleansed, and all evil eyes will learn the true meaning of [revenge].");
		}
	elsif($text=~/revenge/i)
		{
		quest::say("We are the Pickclaw. Once we were of Runnyeye, but when Xorbb corrupted our king and took over the citadel, we fled, risking death in the caverns of the Serpent's Spine rather than submit to Xorbb's twisted rule. We grew strong in the tunnels, learning much about warfare and survival. We honed our skills against the masters of High Keep, and we learned much about the ways of magic from those we captured. But we never forgot where we had come from, and we vowed to one day return. When I saw that Xorbb had grown careless and complacent here, while our clan had grown strong, I took back our home. The name Runnyeye it shall keep, as a reminder of who we WERE, but all who I suffer to live here must prove themselves, as Pickclaws, for this is who we ARE!");
		}
	}
