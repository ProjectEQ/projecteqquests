# Test of Enlightenment - enchanter epic - start of quest
# 

sub EVENT_SAY {
  if ($text=~/are you mizzle/i) {
    quest::say("Oh hello! I'm Mizzle, that I am. I bet you want to be given true clarity, don't you?");
  }
  if ($text=~/i am ready to collect/i) {
    quest::say("Then bring me a spoon, the one key, the lost scroll, and the book Charm and Sacrifice. I will then reward you with what you seek.");
  }
  if ($text=~/spoon/i) {
    quest::say("Its a giant sized tool I will use to stir my magical pot. The spoon will help finish the ritual of crafting.");
  }
  if ($text=~/one key/i) {
    quest::say("It is a key I lost long ago when I was travelling with a companion. We were traveling in the new lands flying over some large crevices when the key dropped out of my pocket.");
  }
  if ($text=~/lost scroll/i) {
    quest::say("The lost scroll contains the magical incantation I need to help you out. It was penned ages ago by the Elves. It was lost along with its protector during one of the raids on the Outpost in Firiona. I fear it may be lost for good.");
  }
  if ($text=~/book of charm and sacrifice/i) {
    quest::say("Oh, that is a book of good reading. If you want to take the time to read it. I haven't had much free time to read it, but now that you are getting supplies for me, I can take a break.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10604 => 1)) {
    quest::say("It is time then, are you ready to get the required components?");
    quest::summonitem(10604);
    quest::summonitem(17861);
  }
  elsif (plugin::check_handin(\%itemcount, 10636 => 1)) {
    quest::say("Oh excellent, you have done what is required. Here take this part, and seek the third master, you are well on your way.");
    quest::faction(342,30);
    quest::exp(100000);
    quest::summonitem(10611);
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: akanon ID: 55017 NPC: Clockwork_VIIX

