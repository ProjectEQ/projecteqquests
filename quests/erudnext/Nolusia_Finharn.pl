sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, $name! Has Lanken sent you to see me? Are you a [visitor or citizen of Erudin]?"); }
if ($text=~/visitor of Erudin/i) {
  quest::say("Then, remember, inside the palace walls, never speak the names of those defilers who have passed on. I shall be at the Vasty Inn later tonight. I can answer your questions there.");
}
if ($text=~/Moodoro/i) {
  quest::say("Moodoro Finharn is my brother. He was a good boy up until he met that accursed halfling named [Flynn] Merrington.");
}
if ($text=~/flynn/i) {
  quest::say("Flynn Merrington talked my brother into stealing waters from the [Vasty Deep] and selling them to any buyers they could find. The waters from the Vasty Deep are sacred. That is why they started their [business].");
}
if ($text=~/vasty deep/i) {
  quest::say("The Vasty Deep waters are said to be magical. Of course this is rumor, but it does not stop magic users from all over Norrath from trying to obtain some of the waters.");
}
if ($text=~/business/i) {
  quest::say("Flynn had talked Moodoro into delivering the waters to him in Qeynos. Eventually Moodoro was caught. He was sentenced to death, but a few spells from yours truly helped him escape death by replacing him with a [doppelganger].");
}
if ($text=~/doppelganger/i) {
  quest::say("The doppelganger's innards were pulled out its esophagus and Moodoro went to Qeynos to start a new life. Unfortunately, he found Flynn there also. Now they have started up again somehow! My guildmaster is aware of this and fears what the High Council will do to our guild when they find this out. Will you [help] me?");
}
if ($text=~/I will help/i) {
  quest::say("Find out how they get the water. Get me the water and I shall put a poison on the seal of the container. Then you carefully carry the container back to Flynn, not to my brother, and we shall put an end to this");
}
}
sub EVENT_ITEM { 
if($itemcount{13118} == 1){
quest::say("Good work! Now, hold the bottle by the label! When you hand Flynn the bottle, the label will slide off. Bring me the label as proof of the deed.");
quest::summonitem("13122","1");
quest::faction("Not_Found","1");
quest::faction("103","1");
quest::faction("302","-1");
quest::faction("Not_Found","1"); }

if (plugin::check_handin(\%itemcount, 13123 => 1)) {
  quest::say("Fantastic. Now I can rest assured that my brother stands a better chance of finding the right path without that manipulating little man around. Master Lanken can rest assured that the waters are safe from abuse.");
  quest::faction( 56, 20);
  quest::faction( 146, 20);
  quest::faction( 143, -20);
  quest::faction( 147, 20);
  quest::summonitem(quest::ChooseRandom(13122, 5019, 6017));
}
}
#END of FILE Zone:erudnext  ID:98002 -- Nolusia_Finharn 

