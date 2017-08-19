sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Grrrreetings. traveler.  Falthrik tells his [stories] now.  Seat yourself near the fire if you wish to [listen].");
  }
  if($text=~/stories/i) {
    quest::say("Once Falthrik was mighty saiar but no more. Years have weakened Falthrik's knees. made his back frail. dulled his once powerful claws.  Falthrik now earns his rank and keep in the pride by telling stories. amusing the people. teaching the young his knowledge with stories.");
  }
  if($text=~/listen/i) {
    quest::say("Rrrrr.  Many stories Falthrik has to tell.  Most would not suit you. would not translate to common well but perhaps I tell you [history] of Kerrans. stories of their past and present.");
  }
  if($text=~/history/i) {
    quest::say("So you wish to listen?  That is good.  Then sit. listen to the story of the pride.  Our stories all start the same.  In the beginning there was the mighty Kejaan.  No one remembers the lineage of Kejaan.  Many think he didn't have one.  It is said no god made him. that his spirit came from the winds and his body from the rocks.  Wherever he came from. his [legends] are many.");
  }
  if($text=~/legends/i) {
    quest::say("Kejaan traveled the land of Odus far and wide.  He visited the splintered and fighting tribes of Kerrans and gathered together his companions. Kerrans of power and knowledge.  Together Kejaan and his companions tamed the wild lands of Odus.  They journeyed through jungle. desert. and beach killing monsters and evil.  They made the land safe for all Kerrans.  This is when the [golden time] started.");
  }
  if($text=~/golden time/i) {
    quest::say("Rrrrr..  The golden time.  After Kejaan and his companions tamed the lands. he came back to the splintered tribes.  With his strength of claw and mind. he [united] all the Kerran people around him. made them into a mighty civilization. Made them strong and smart.");
  }
  if($text=~/united/i) {
    quest::say("For many hundreds of years. Kerrans were mighty and wise.  Elves. dwarves. humans. all races knew the might of Kerra.  All things end though. and our empire fell eventually. our proud history and achievements torn apart and destroyed by the foul Erudites.  We could have shared land but the haughty Erudites would not share. so they [destroyed].");
  }
  if($text=~/destroyed/i) {
    quest::say("Destroyed utterly.  Tried to remove all trace of great Kerran works.  Cities. statues. writings.  All gone.  Kerrans fled to this tiny island. forced to leave by Erudites.  Many Kerrans. many of our finest. died on journey here.  Poets. warriors. shamans. children.  Kerrans settled here. made this little island of dirt home. continued [old customs and traditions].");
  }
  if($text=~/old customs and traditions/i) {
    quest::say("Yes.  How we live.  Way we organize.  In Kerran peoples. magic runs greatest in females.  They grow larger and stronger.  It is females who are most worshipped and revered as mothers and protectors.  That is why all adult female Kerrans live in inner village and all [males] live on beach.");
  }
  if($text=~/males/i) {
    quest::say("Male Kerran smaller and quicker than female.  Male Kerran make good guards.  Females watch after Kerran souls and guide Kerrans. males guard Kerran safety.  All Kerrans understand their [place] in life.");
  }
  if($text=~/place/i) {
    quest::say("Many places.  Young live on beach and learn how to be shamans. guards. or tradespeople.  Old live their last days on beach teaching young.  Males guard all of Kerra.  Females guard inner village. leaders. and talk to spirits.  It is right way of things.  Rrrrr..  I have talked for so long.  Must eat and rest now.");
  }
}
#END of FILE Zone:kerraridge  ID:74019 -- Falthrik_Lothoro