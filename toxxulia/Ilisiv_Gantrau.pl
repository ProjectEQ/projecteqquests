# items: 28034, 55273
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You wield great power. The wind whispers to me. You seek to learn more about the augmentation stones found in ruins long forgotten. They hold great power. A mysterious power. I fear however that if you were to fuse one of these magical stones to your Orb of Mastery, it would be lost due to the transitory nature of the Orb. I believe after much research I have discovered a way for you to make use of these stones if you are [interested].");
  }
  elsif($text=~/interested/i) {
    quest::say("It looks like your Orb of Mastery is already able to make use of augmentation stones. I cannot help you further.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#Scripted By: Fatty Beerbelly