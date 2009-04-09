sub EVENT_SAY
{
  if($text=~/Hail/i)
  {
    quest::say("Hello. child.  Welcome to the Temple of Life. Here. you may pay homage to the [Prime Healer]. [Rodcet Nife].  If you are in need of [healing] or require me to [cure disease] or [cure poison]. please inform me.  I am the resident healer of all Qeynos citizens.");
  }
  if($text=~/cure disease/i)
  {
    quest::say("Yes. we can do that.  First. you must fetch me some bandages and brew me some bog juice.  I.. err.. require the bog juice to.. to dampen the bandages.. Yes that's it!  To dampen the bandages.");
  }
  if($text=~/cure poison/i)
  {
    quest::say("To cast the poison from your body I require one snake fang.  The fang will contain a hint of poison which will help me focus my casting.");
  }
  if($text=~/prime healer/i)
  {
    quest::say("He is the sustaining force of all life.  It is in honor of Him that the Temple of Life was built.  Engineered with the help of the [Academy of Arcane Science].");
  }

  if($text=~/academy of arcane science/i)
  {
    quest::say("The Academy of Arcane Science is the greatest school of magic in Antonica.  It houses a wealth of resources and knowledge pertaining to any of the circles of magic.  It is also a marvel of magical engineering.  If you should ever visit Freeport. be sure to let me know.  I seek a faithful cleric to [pickup a reagent].");
  }
  if($text=~/pickup a reagent/i)
  {
    quest::say("Please deliver this potion to Serna Tasknon in The Academy of Arcane Science, she will know what it is that I require.");
  }
  if($text=~/rodcet nife/i)
  {
    quest::say("He is the sustaining force of all life.  It is in honor of Him that the Temple of Life was built.  Engineered with the help of the [Academy of Arcane Science].");
  }
}

sub EVENT_ITEM
{
  # Check for Bog Juice ID: 16581 and Bandages ID: 13009
  if(plugin::check_handin(\%itemcount, 16581 => 1, 13009 => 1))
  {
    # Cast Counteract Disease ID:96 on self
    quest::selfcast(96);
  }
  # Check for Snake Fang ID: 13067
  if(plugin::check_handin(\%itemcount, 13067 => 1))
  {
    # Cast Counteract Poison ID:95 on self
    quest::selfcast(95);
  }

  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2081 -- Tonmerk_Plorsin