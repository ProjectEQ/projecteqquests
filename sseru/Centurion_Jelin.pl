# items: 6269
sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Welcome to my home, my apologies for being untidy. I have been preoccupied with the thought of my brother lately. I love Seru and I love this town do not get me wrong, but it still makes me sad to see someone cast out. He was forced to submit to the Question when he was found to be supplying [Recuso] with food, water, and medical supplies. Because of the power of the question, they soon found this out, and now he has to live amongst the very people he was helping.");
		}
	if($text=~/Recuso/i)
		{
		quest::say("The Recuso are the refused. They are cast out of Sanctus Seru because of their crimes against the city, their incompetence, or for any other number of political reasons. Because you are questioned by a Praesertum other than the one that you are in, it is kept unbiased. My brother committed crimes against the city by assisting the Recuso. The refused are sent to Marus Seru as punishment and [interfering] with that punishment is interfering with Seru's way."); 
		}
   if($text=~/interfering/i)
      {
      quest::say("I would never be able to aid him, let alone think of it without failing the question. I just wish I knew how he was doing. I could not check on him, and could not ask you to check on him either, or you would defy Seru. That is something that I could not ask of anyone. The Question is a horrible ordeal. You will either die from being cast to Marus Seru or from the draining power of the Question itself.");
      } 
}

sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 6269 => 1)) {
    quest::emote("looks at you puzzled and takes the letter and reads it. 'Oh I am so glad that he is alive! I am happy that you took the time to ease my worries about him. I shall let the people of this town know that you come with good intentions. For now i will rest for I have not slept in days.'");
    quest::faction(1499,2); #Citizens of Seru
    quest::faction(1484,2); #Hand of Seru
    quest::faction(1486,2); #Heart of Seru
    quest::faction(1485,2); #Eye of Seru
    quest::faction(1487,2); #Shoulders of Seru
    quest::faction(1502,-4); #Katta Castellum Citizens
  }
  plugin::return_items(\%itemcount);
}
