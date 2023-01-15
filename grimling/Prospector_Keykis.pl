# items: 63160, 63157, 63145, 63135
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Oh, hello! Are you busy at the moment...I need a [quick favor].");
  }
  if ($text=~/quick favor/i) {
    quest::say("With your prowess, this task shouldn't be too difficult. A bit time consuming maybe, but worth the effort. I need ore samples from deep within the mountain .. from Acrylia Caverns itself. Now, I'm looking for a specific form of the ore .. pristine shards. The Grimlings of the caverns apparently use these as money so you'll no doubt have an easier time finding the shards on ...ahem...them. But you have to be [careful].");
  }
  if ($text=~/careful/i) {
    quest::say("Well, no one outside the caverns has actually ever seen a pristine shard. And I'd like to keep it that way. Take this staff and put the samples in it. It has secret compartments in it that should hold the eight shards I'm after. Return it to me and I'll make it well worth your while.");
    quest::summonitem(63160); # 63160  Compartmented Staff
  }
  if ($text=~/wealth of possibilities/i) {
    quest::say("Yes. I'm sure you already know the value of the ore. With the war against the Grimlings going so well, I've been sent to sample the purity of the remaining ore. Unfortunately, I'm not a warrior and it's almost impossible to retrieve the [samples] I need.");
  }
  if ($text=~/samples/i) {
    quest::say("I need a range of samples from within the mine. Six should be enough. Actually ... would you mind getting the samples for me? Please? Here's a chest for you to carry them in.");
    quest::summonitem(63157); # 63157  Prospector`s Sample Chest
  }
}

sub EVENT_ITEM {
  # 63145 :  Shard Filled Staff
  if (plugin::check_handin(\%itemcount,63145=>1)) {
    quest::say("Yes...exactly whay I was after. On the down side, such a pure source of Acrylia will no doubt fuel this war further. But, on the up side, there's a lot of profit to be made. Thank you, $name. Here, this should give you a taste of the wealth of possibilities. Ha!");
    quest::exp(300000); # Lots of xp, that's mostly the reward of that quest
    quest::givecash(0,0,0,750); # 750 plat
    quest::faction(1552,10); # VahShir Crusaders
  }

  # 63135 :  Loaded Sample Chest
  if (plugin::check_handin(\%itemcount,63135=>1)) {
    quest::say("So... perfect! Thank you");
    quest::exp(300000);
    quest::givecash(0,0,0,300);
    quest::faction(1552,10); # VahShir Crusaders
  }

  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:grimling  NPC:167113 -- Prospector_Keykis
