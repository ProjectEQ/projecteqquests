sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Well met $name. are you the new recruit that was sent to me to help exterminate the [Zelniaks] that attack our guards and caravans?");
		}
	if($text=~/zelniaks/i)
		{
		quest::say("Weren't you briefed on this already? The zelniaks are highly aggresive scaled creatures with a large mane of fur that runs down the length of their back. They are a constant problem for the guards and caravans that used to travel in [dawnshroud].");
		}
	if($text=~/dawnshroud/i)
		{
		quest::say("are you new here or something? The Dawnshroud Peaks are a range of mountains lush in vegetation and water. We used to utilize the area as a trade route to Shadow Haven. The caravans that would travel through were often attacked by roaming zelniaks. I thought you were the one that was sent to me to [help lower] the amount of zelniaks in the area. So the trade route could be reestablished.");
		}
	if($text=~/help lower/i)
		{
		quest::say("How ambitious of you to help the mighty warriors of the Hand. If you choose to serve Seru bring me back four Zelniak Meat. I will reward you for your time in the field.");
		}
	if($text=~/peran/i)
		{
		quest::say("Centurion Peran is new to the tanks. He gets things done I suppose it just takes him a long, long time. Since you did his job for him, take him these new orders. We will make a soldier out of him yet.");
		quest::summonitem(6514);
		}
}

sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 10692 => 4)) {
    quest::say("Although your service to Seru is appreciated, I just recieved word that you were not the one that was sent to do this menial task. That lazy boy [Peran] was supposed to take the job.");
    quest::givecash(9,9,9,9); #this amount is made up i could not locate the correct amount
    quest::faction(37,2); #Citizen of Seru
    quest::faction(139,2); #Hand of Seru
    quest::faction(142,2); #Heart of Seru
    quest::faction(96,2); #Eye of Seru
    quest::faction(298,2); #Shoulder of Seru
    quest::faction(168,-4); #Katta Castellum Citizen
  }
  else {
    plugin::return_items(\%itemcount);
  }
}


#End of File zone: sseru ID: 159417 -- Legionnaire Delaren
#By Kovou