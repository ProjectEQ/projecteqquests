# items: 69945, 69946
sub EVENT_SAY { 
	if($text=~/Hail/i){
		if($client->GetGlobal("paladin_epic") ==4) {
			quest::say("I'm so glad to find a fellow knight. Hail to you $name. I was curious, are you traveling through or could you possibly help me [" . quest::saylink("try to find my sister") . "]?");
		}
		else {
			quest::say("Hello $name.");
		}
	}
	if($client->GetGlobal("paladin_epic") ==4 && $text=~/sister/i){
		quest::say("My sister Drema and I were traveling through Tenebrous Mountains after trading some supplies in Katta Castellum. We ended up setting camp in Mons Letalis for the night, so that we could have an early start on our journey back to Dawnshroud the next day. The next morning I woke up and my sister was gone! Nothing remained on her cot from the night before. . .I'm not sure where she disappeared off to. I spent the course of several days searching all of Mons Letalis for her, but I couldn't find any clues that would lead me to her where-abouts. I journeyed back to Dawnshroud Peaks and had my friends here make a rescue party so that we could find her. We set out to look for her and spent several days in Marus Seru, Mons Letalis, and the Grey looking for any sign of her. We did not [" . quest::saylink("find anything") . "].");
	}
	if($client->GetGlobal("paladin_epic") ==4 && $text=~/find anything/i){
		quest::say("As we were turning back to Dawnshroud Peaks, my good friend Ryann Desgrey found her locket in the dirt in the Grey. Here, take the locket. Perhaps you will have a better chance of finding her, and perhaps she will come with you once you present her with the locket. Please, let her know that I miss her and that we all want her to come home safely. Go now, noble paladin.");
		quest::summonitem(69945); # Item: Drema's Locket
	}
}

sub EVENT_ITEM {
  if ($client->GetGlobal("paladin_epic") ==4 && plugin::check_handin(\%itemcount, 69946 => 1)) {
    quest::say("You have found her in Mons Letalis? This is her fingerbone, what has happened? She has turned into a skeleton? Oh my, this is grave news indeed. Show this fingerbone to Denns, maybe he can figure out a way to investigate this dire situation.");
	quest::summonitem(69946); # Item: Drema's Fingerbone
	quest::setglobal("paladin_epic",5,5,"F");
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:dawnshroud  ID:174100 -- Mikhal_Young 

