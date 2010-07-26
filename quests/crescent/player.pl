## player.pl
##
## Created by mrhodes for use in tasks/perl questing

#Task 182 - Ways of Nature - Initiate Dakkan in Crescent Reach
#Task 183 - Snake Sacs - Initiate Dakkan in Crescent Reach
#Task 185 - Cap of Color - Jinkin
#Task 186 - Here Kitty, Kitty - Jinkin
#Task 187 - Thrills and Quills - Jinkin

sub EVENT_TASK_STAGE_COMPLETE {
  if($task_id == 182 && $activity_id == 1) {
    quest::summonitem(53481, 5);
    quest::signalwith(394147, 1);
    quest::me("Dakkan is one step further in his quest to learn about nature and could use your help.");
    quest::exp(500);
    quest::ding();
  }
  if($task_id == 183 && $activity_id == 1) {
    quest::summonitem(53482, 5);
    quest::signalwith(394147, 1);
    quest::me("Dakkan is getting closer to learning all he needs to about poison, but he still has more to learn.");
    quest::exp(500);
    quest::ding();
  }
  if($task_id == 185 && $activity_id == 1) {
    quest::summonitem(53485, 10);
    quest::me("Jinkin now has a full supply of dye, but as diligently as she works, it won't last long.");
    quest::exp(500);
    quest::ding();
  }
  if($task_id == 186 && $activity_id == 2) {
    quest::summonitem(53484, 10);
    quest::me("Jinkin has enough fangs now to complete her necklace, but she still has a lot of work to do!");
    quest::exp(500);
    quest::ding();
  }
  if($task_id == 187 && $activity_id == 3) {
    quest::summonitem(53486);
    quest::me("Jinkin has enough hides to make many bracelets now. Hopefully, someone will buy them . . .");
    quest::exp(500);
    quest::ding();
  }
}

sub EVENT_ENTERZONE {
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($client->GetStartZone()==$zoneid)) {
    $client->Message(15, "A mysterious voice whispers to you, 'Vladnelg Galvern has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }
}