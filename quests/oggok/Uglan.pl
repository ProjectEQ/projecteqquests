#npc - Uglan
#zone - Oggok
#class - all
#part 2 to crude stein

sub EVENT_ITEM
{
 if($itemcount{16547} == 1)
  {
   quest::say("Ay, I be needin ya to intercept an Orc Runner carryin a sealed letter. Get da letter and give it ta Lork.");
  }
}
