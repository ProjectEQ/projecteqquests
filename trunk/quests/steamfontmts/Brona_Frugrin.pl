# Quest for Staff of the Observers
# Changed text slightly since Borxx no longer spawns on live.

sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Well met, $name!  What brings you out this way?  Are you interested in becoming an observer?  No, you look like the adventuring type.  The wilds of the Steamfont Mountains is as far as my body goes.  But through my [duties] as an observer, my mind travels the cosmos.");
  }
  if($text=~/duties/i){
    quest::say("Well, I am quite an accomplished enchanter but most of my time now is spent crafting the magical lenses that enable us to see beyond the ceiling of Norrath and into other realms and dimensions.  Say, in your travels have you encountered any [evil eyes]?");
  }
  if($text=~/evil eyes/i){
    quest::say("Evil eyes are dangerous creatures of great magical power.  You will know one if you see one.  I believe that with the lens from an evil eye and some expert tinkering, I could create a device that will enable me to observe the gods themselves in their native planes.  If you were to bring me one of these lenses, the Eldritch Collective would reward you greatly.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10170 => 1)) {
    quest::say("This lens is perfect, $name!  Please, take this staff in return for your services.");  # Couldn't find real text, so I made this up.
    quest::summonitem(10171);
    quest::exp(100);
    quest::faction(176, 15);  # King Ak'Anon
    quest::faction(91, 15);  # Eldrich COllective... I'm not sure about this, but quest text seems to indicate it should be here
  }
  plugin::return_items(\%itemcount);
}