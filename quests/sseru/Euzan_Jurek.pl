sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name");
  }
  if ($text=~/Torsten/i) {
    quest::say("So Torsten has sent you? He must see the potential within you to help us. I cannot give you any information right now as to who we are. That is a trust you must [earn].");
  }
  if ($text=~/earn/i) {
    quest::emote("leans in and whispers to you.");
    quest::say("Let it be known that assisting us will show your distrust in everything this city stands for. If you do not want to get involved I urge you to walk away now. However if you wish to [bring about change], stay and I will tell you how to earn our trust.");
  }
  if ($text=~/bring about change/i) {
    quest::say("Good, you must do something for us. One of our members, who needs not be named, is due to be called for the Question. We need you to go into the Heart [Consillium] and replace their records with this one. This false record shows that they have completed their Question and still have time until their next one. Changing the records will make the question pass over us so that we avoid being discovered. Go in stealth, when you have completed this task bring me back the original records and your Insignia Earring.");
    quest::summonitem(29855); # 29855  Replacement Records
  }
  if ($text=~/Consillium/i) {
    quest::say("The Praesertum Consillium are the four structures found in the center of Sanctus Seru. They are surrounding the Arx Seru, which is where Seru himself resides. These buildings are heavily guarded with the leader of each.");
  }
}

sub EVENT_ITEM {
  # 29856 :  Original Records
  # 29857 :  Insignia Earring of Veracity
  if (plugin::check_handin(\%itemcount,29856=>1,29857=>1)) {
    quest::say("By now you must realize that we need to avoid the question because of whom we are. Seru is not the Noble Paladin this city would have you believe. You see they teach that Katta feared Seru and that he had faked his own poisoning so they could pin the blame on Seru. The next thing that I ask of you, I ask because you can travel without question from one city to another. Go to Katta and give this report to Tilbok Furrunner. Tell him we are successfully rooted within Sanctus Seru and await any commands.");
    quest::summonitem(29858); # 29858  Etched Earring of Veracity
    quest::summonitem(29891); # 29891  Report to Tilbok
    quest::exp(30000);
    quest::faction(96,-30); # Eye of Seru
    quest::faction(139,-30); # Hand of Seru
    quest::faction(284,-30); # Seru
    quest::faction(55,-30); # Coterie of the Eternal Night
    quest::faction(138,-30); # Hand Legionnaries
    quest::faction(228,-30); # Nathyn Illuminious
    quest::faction(168,10); # Katta Castellum Citizens
    quest::faction(350,10); # Validus Custodus
    quest::faction(206,10); # Magus Conlegium
  }

  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:sseru  NPC:159422 -- Euzan_Jurek
