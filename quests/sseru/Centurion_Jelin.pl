sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Welcome to my home, my apologies for being untidy. I have been preoccupied with the thought of my brother lately. I love Seru and I love this town do not get me wrong, but it still makes me sad to see someone cast out. He was forced to submit to the Question when he was found to be supplying [Recuso] with food, water, and medical supplies. Because of the power of the question, they soon found this out, and now he has to live amongst the very people he was helping.");
		}
	if($text=~/Recuso/i)
		{
		quest::say("Yes, they are a landless people, usually found to be in Marus Seru."); #Text made up
		}
}

sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 6269 => 1)) {
    quest::emote("looks at you puzzled and takes the letter and reads it. 'Oh I am so glad that he is alive! I am happy that you took the time to ease my worries about him. I shall let the people of this town know that you come with good intentions. For now i will rest for I have not slept in days.'");
    quest::faction(37,2); #Citizens of Seru
    quest::faction(139,2); #Hand of Seru
    quest::faction(142,2); #Heart of Seru
    quest::faction(96,2); #Eye of Seru
    quest::faction(298,2); #Shoulders of Seru
    quest::faction(168,-4); #Katta Castellum Citizens
  }
  else {
    plugin::return_items(\%itemcount);
  }
 }