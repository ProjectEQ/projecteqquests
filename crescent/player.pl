## player.pl
##
# items: 53481, 53482, 53485, 53484, 53486

#Task 5431 - Ways of Nature - Initiate Dakkan
#Task 5427 - Snake Sacs - Initiate Dakkan
#Task 10644 - Cap of Color - Jinkin
#Task 6800 - Here Kitty, Kitty - Jinkin
#Task 10645 - Thrills and Quills - Jinkin

sub EVENT_TASK_STAGE_COMPLETE {
  if ($task_id == 5431 && $activity_id == 1) { #Ways of Nature Step 2
    quest::summonitem(53481, 5); #Potion of Minor Relief x 5
    quest::signal(394147); ##Initiate Dakkan
    $client->Message(4,"Dakkan is one step further in his quest to learn about nature and could use your help.");
    quest::exp(500);
    quest::ding();
  }
  if ($task_id == 5427 && $activity_id == 1) { #Snake Sacs Step 2
    quest::summonitem(53482, 5); #Potion of Quickened Thought x 5
    quest::signal(394147); ##Initiate_Dakkan
    $client->Message(4,"Dakkan is getting closer to learning all he needs to about poison, but he still has more to learn.");
    quest::exp(500);
    quest::ding();
  }
  if ($task_id == 10644 && $activity_id == 1) {
    quest::summonitem(53485, 10); # Item: Sporeling Essence Potion
    $client->Message(4,"Jinkin now has a full supply of dye, but as diligently as she works, it won't last long.");
    quest::exp(500);
    quest::ding();
  }
  if ($task_id == 6800 && $activity_id == 2) {
    quest::summonitem(53484, 10); # Item: Jinkin's Hearty Elixir
    $client->Message(4,"Jinkin has enough fangs now to complete her necklace, but she still has a lot of work to do!");
    quest::exp(500);
    quest::ding();
  }
  if ($task_id == 10645 && $activity_id == 3) {
    quest::summonitem(53486); # Item: Quill-Studded Bracer
    $client->Message(4,"Jinkin has enough hides to make many bracelets now. Hopefully, someone will buy them . . .");
    quest::exp(500);
    quest::ding();
  }
  if ($task_id == 505746 && activity_id == 1) {
    quest::summonitem(57974); #Crescent Reach City Charter
    $client->Message(4, "You pull the city charter from the bookshelf and your heart begins to beat just a little faster. You feel just a bit more at home in Crescent Reach.");
  }
}

sub EVENT_ENTERZONE {
  if (($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($client->GetStartZone()==$zoneid)) {
    $client->Message(15, "A mysterious voice whispers to you, 'Vladnelg Galvern has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }
}