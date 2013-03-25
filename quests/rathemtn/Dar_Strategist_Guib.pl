sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Well hello there. I don't mean to be rude but I am trying to enjoy a short break alone and enjoy my favorite Ale.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67010 => 1)) { #Mug of Poisoned Ale
    quest::me("You hand Guib the mug of ale laced with Froglok's Bane. He grins and downs the deadly syrup in one gulp.");
    quest::say("Thanks young one, that was just what I needed. Take this as a token of my gratitude. Perhaps you will join our ranks when you get older.");
    quest::summonitem(67009); #Insignia of the Gukta Knights
    quest::faction(264,-25);
    quest::exp(100000);
    quest::me("The strategist shouts in pain, then there is a thud as his armor clatters to the floor. As he falls to the floor, he gasps for help in an insidious whisper. A portal opens and three frogloks appear. The poison has taken it's victim swiftly just as you were told. You grin to yourself evilly as Guktan healers rush to the aid of their fallen comrade. From this day forward Gukta will forever be changed.");
    $npc->SetAppearance(3);
    quest::settimer("depop",5);
    #quest::signal(); #To be used later when quest working as intended
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop_withtimer();
}

sub EVENT_SIGNAL {
  quest::depop_withtimer();
}