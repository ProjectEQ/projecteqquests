## Vivian the True
## Edited on April 17, 2010 by mrhodes
##
## Note: Added the Tomes of Knowledge (Beastlord and Rogue) as well as
## Training Day tasks.

sub EVENT_SAY {
  if(quest::istaskactive(138)) { #New Beginnings
    quest::say("You fought alongside Arias in the Mines of Gloomingdeep! He's alive then! Thank the gods! Thank the gods and thank you, stranger! Please let me repay your kind news with my hospitality. I can help you establish yourself here in the Plane of Knowledge. Really, it's the least I can do.");
    quest::updatetaskactivity(138,0);
  }
  else {
    if ($text=~/hail/i) {
       quest::say("Welcome to the Plane of Knowledge, or New Tanaan. All are welcome here, so please feel free to explore. Our home here is a safe haven to those who seek knowledge of all sorts, and many find themselves setting off upon new adventures based on what they find here. No harmful magics may be used, nor weapons. Our fair city also acts as a hub of sorts into Norrath and other destinations. Are you [new to the world]?");

        #if currently on Tomes of Knowledge (Beastlord)
        if(quest::istaskactivityactive(200, 1))
        {
           quest::updatetaskactivity(200, 1);
            quest::ding();
            quest::exp(500);
        }
        #if currently on Tomes of Knowledge (Rogue)
        if(quest::istaskactivityactive(201, 1))
        {
           quest::updatetaskactivity(201, 1);
            quest::ding();
            quest::exp(500);
        }
        #if currently on Training Day (Rogue)
        if(quest::istaskactivityactive(202, 1))
        {
           quest::updatetaskactivity(202, 1);
            quest::ding();
            quest::exp(500);
        }
    }

    if($text=~/new to the world/i)
    {
       if($class eq "Beastlord")
        {
           quest::taskselector(200);
        }
        if($class eq "Rogue")
        {
           quest::taskselector(201, 202);
        }
    }
  }
}

sub EVENT_ITEM {
  quest::say("I do not need this. You may have it back.");
  plugin::return_items(\%itemcount);
}