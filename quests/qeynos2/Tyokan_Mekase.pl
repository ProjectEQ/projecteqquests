#end of the quest started by Brother Estle in West Karana
#npc - Tyokan Mekase
#zone - North Qeynos

sub EVENT_SAY
{
 if($text=~/Hail/i)
  {
   quest::say("Please look around. We have many items exclusively for the members of the Temple of Life. We also have [scroll strongboxes]. If you are unsure of what an item is, feel free to ask me.");
  }
 if($text=~/what scroll strongboxes/i)
  {
   quest::say("The scroll strongboxes are merely personal safes. Most of the members use them. I am afraid all are taken, but if you are here to remove a scroll, merely hand me your key and I shall get it for you. I handle all 20 numbered keys and [Whysia] handles all 30 and 40 numbered keys.");
  }
}

sub EVENT_ITEM
{
 if($itemcount{13306} == 1)
  {
   quest::say("Oh, turning in your key, are you? Very well, defender of life. Here you are.");
   quest::summonitem(quest::ChooseRandom(15126,15126,15248));
  }
}