sub EVENT_SAY{
  if ($text=~/Hail/i){
  quest::say("That's right. Large, cause that's what I be. If'n ya don't like it, or even if ya do, ya best get to the dock on the other side o' this island. Ya never know when [Icebreaker] is gonna stop by again and yet not wantin' ta miss it.");
  }
  if($text=~/icebreaker/i)
  {
  quest::say("What about it? Wait. How did you get here? There weren't no raft come to this island. Come to think o' it, I don't think I've heard hide nor hair o' the Icebreaker for a while. Well, drat. I wonder if anyone's been looking for me. Here, have this bandana to let whoever know that I'm alright. Thanks for checking up on me, but I'll be ok here for a while longer.");
  quest::summonitem(60333);
  }
} 

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

