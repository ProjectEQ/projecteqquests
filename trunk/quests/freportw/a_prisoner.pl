sub EVENT_SAY {
  if($text=~/Hail/i)
  {
    quest::say("Aaaarghhh!!.. Buggl n gump.. Figgle and fump..");
  }
  if($text=~/Are you Ariska Zimel/i)
  {
    quest::emote("stares deeply into your eyes.. Very eerie!!");
  }
}

sub EVENT_ITEM
{
  #Check for:
  #Bunker Cell 1 ID:12196
  #Bog Juice ID: 16581
  #Edible Goo ID: 13498
  if(plugin::check_handin(\%itemcount, 12196 => 1, 16581 => 1, 13498 => 1))
  {
    quest::say("Bog n Goo.. Blanket too!!");
    quest::say("Bog n Goo.. Blanket too!!");
    quest::say("Hide, hide, safe, cee.. lerk has the clue.. Must travel.. Travel.. Travel.. Tunaria's corridor..");

    # Summon H. K. 102 ID: 12143
    quest::summonitem(12143);
  }
}

#END of FILE Zone:freportw ID:9035 -- a_prisoner