#BeginFile: rivervale\Ace_Slighthand.pl
#Quest file for Rivervale - Ace Slighthand: Kevlin Diggs' Debt & Extraordinary Rodents

sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(12,2)) { #Task: Extraordinary Rodents
      quest::say("Your help in getting rid of those mongrels is more appreciated than you know. There's just one thing left for you to do though, and that's to deliver four Rat Whiskers to Swish Appletop. I'm sure getting some additional supplies will be a relief.");
      quest::updatetaskactivity(12,2);
    }
    else {
      quest::say("Hey, hey, hey! Welcome to the Fool's Gold. Don't bet more than you can afford to lose, pal! You don't want to end up like ol' [Kevlin]. If you're looking for something to do after you have a drink, you may be interested in a [task].");
    }
  }
  if($text=~/task/i) {
    if($ulevel > 4 && $ulevel < 9) { #Maximum level for task is 8. Minimum level is currently unknown.
      if(quest::istaskactive(12)) { #Task: Extraordinary Rodents
        quest::say("Extraordinary Rodents is already in progress.");
      }
      else {
        quest::taskselector(12); #Task: Extraordinary Rodents
      }
    }
      else {
      quest::say("I'm afraid you're not yet ready for the tasks I have available. You should seek out areas more fitting to your experience.");
    }
  }
  if($text=~/kevlin/i) {
    quest::say("Kevlin Diggs. His family sells armor here in Rivervale. He has a nice shop right across from us here. But he owes us Deeppockets some [gold] that we need to collect. We can't rough him up because he is a friend of Mayor Gubbin. We need someone to steal it.");
  }
  if($text=~/gold/i) {
    quest::say("He keeps his money in a sack on his bed. But he has a mean pet wolf, named Mangler, who mangled the last cutpurse we sent after it. If you were to wait until he leaves his shop, then sneak past Mangler and bring me the money he owes us, I will make it worth your time.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13182 => 1)) { #Kevlin's Debt
    quest::say("Heh heh! You got a career ahead of ya kid! Good work. Here is your cut.");
    quest::exp(300);
    quest::ding();
    quest::givecash(4,10,0,0);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TASKACCEPTED {
  quest::say("It's no small wonder that the locals are skittsh. There have been reports of some monsters lurking about that are a threat to not only the people, but the livestock and the supplies as well. You're going to need to help give them back a little piece of mind. To do that, you're going to kill 10 giant thicket rats. Remember, they're threatening the supplies, so be sure to loot four Rat Whiskers, while you're out there. The locals are counting on you.");
}

#END of FILE Zone:rivervale  ID:19093 -- Ace_Slighthand