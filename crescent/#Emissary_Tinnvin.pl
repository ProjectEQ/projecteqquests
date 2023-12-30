sub EVENT_SAY {
  if ($text=~/hail/i) {
    if ($race eq "Drakkin") {
      quest::say("Vasha, young drakkin. It would seem you have found your way to your new and true home. I'm sure by now you've all but forgotten your past and even how you arrived here in Crescent Reach - the diamond in the mountains. As our newest family member, I urge you to familiarize yourself with your city. You should visit your guildmaster at the bottom of this path. Then, speak to Initiate Dakkan and Innkeeper Fathus for work.  Dakkan has lots of work and Fathus will help you gain a goodly reputation with the Six -- our dragons -- so they will accept you as a true-blood drakkin. May Veeshan guide you always!");
    }
    else {
      quest::say("Vasha, friend. Welcome to Crescent Reach, the diamond of the mountains. As a newcomer here I invite you to familiarize yourself with our fair city.  All youths should visit their guildmasters for training at the bottom of this path. Seek out Initiate Dakkan and Innkeeper Fathus.  Dakkan has plenty of work and Fathus will help you gain a goodly reputation with the Six -- our great dragons -- so that they might acknowledge you. Glory to Veeshan!");
    }
    if (!quest::istaskcomplete(2)) {
      quest::taskselector(2); #Task: Welcome to Crescent Reach
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}