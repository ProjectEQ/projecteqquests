sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail $name! It is a pleasure to have such seasoned adventurers visit our noble city. I am Magistrate Celris Shadetracker of the Loyalist Combine Empire. I was of the original members of the Combine Empire to arrive here on Luclin and have since become quite familiar with its many lands and their inhabitants. I used to travel extensively but in my old age I have found comfort in remaining here at the Tsaph Katta Hall telling younger explorers of my many journeys and teaching them of the [dangers] that abound.");
  }
  if($text=~/dangers/i) {
    quest::say("There are dangers everywhere for one does not know what to expect or is not careful and attentive while traveling the lands of Luclin. Among the largest of dangers in this region of Luclin are the vampyres of the Coterie of the Eternal Night. The coterie has been particularly active lately and we have already lost scouts attempting to track their [activities].");
  }
  if($text=~/activities/i) {
    quest::say("One of the vampyre volatilis, the winged leaders of the Coterie of the Eternal Night, has been followed flying from their Aerie in the Tenebrous Mountains to a small vampyre settlement in the Maidens Eye far to the south. The volatilis appears to be picking up shipments of wineskins from a vampyre at the settlement and bringing them to their Aerie. I doubt that the skins actually contain wine or any other such relatively harmless liquid. If you could return one of these skins to me I will gladly honor you as I would one of my own scouts.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 7776 => 1)) { #Skin of Blood Like Substance
    quest::say("Excellent work, $name. It is just as I feared. Take this as a reward for reporting on the Coterie activities."); #Text made up
    quest::summonitem(7777); #Validus Scout Cloak
    quest::faction(52, 10);   #Concillium Universus
    quest::faction(284, -10); #Seru
    quest::faction(139, -10); #Hand of Seru
  }
  plugin::return_items(\%itemcount);
}