sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("It is a pleasure to meet you, but I do not have time to speak. I am waiting on official word from Shar Vahl. If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time. If you are not such a person, please carry on with your business and leave me to tend to mine.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9031 =>1 )) {
    quest::say("It is a relief to see you. I was beginning to fear that no one would be able to find me in this miserable swamp. I wanted to get word back to Shar Vahl about my location, but I was afraid that I would lose the trail off this spirit if I were to break off my pursuit. This location is as strange of a destination for our spirit as it is dangerous. I have seen the spirit several times and it is very out of place here. I can't help but think that the transformation has left the spirit confused beyond all repair.");
    quest::say("If you move towards the large body of water just north of here, you should be able to find a vantage point that will allow you to see it. The spirit has been resting under the surface of the water there for several days now. Once you release the spirit, please return to me with the totem that binds it. I will prepare the totem, so that you may return it to Shar Vahl.");
   quest::emote("A giant reptile roars, as it sinks below the surface of the pond. It appears that is senses your approach.");
   quest::spawn(83244,0,0,2289,-3001,-28);  
  }
  
  if (plugin::check_handin(\%itemcount, 9042 =>1 )) {
    quest::say("Splendid job, $name. This wrapping should help to shield you from any of the negative properties that may be manifested in the totem. You should be fine if you keep it in the box that you were given. Once you collect all of the totems, please seal the box and return it to Shar Vahl. Be careful to protect the totems during the course of your travels. The balance of power in several realms is reliant on your ability to fulfill this mission. Please do not fail us.");
    quest::summonitem(9043);
    quest::summonitem(9031);
  }
  plugin::return_items(\%itemcount);
}