#Welnik's Picks and Ore by druid64 02/02/2012 
# #Smith_Numden.pl for Welnik's Picks and Ore Quest. This files goes in /quests/steamfont/ or /quests/steamfontmts/ depending on your server
# items: 54431, 54434, 54432, 54433, 54435

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 54431 => 1, 54434 => 1, 54432 => 1, 54433 => 1)) { # Chipped Cracked, Rusted and Wobbly Pick 
    quest::say("These picks are in sad shape, that they are. This would take longer than it is worth. I just forged some new ones, just take those and get out!");
    quest::ding();
    quest::summonitem(54435); # Item: Bundle of Shiny New Picks
    quest::exp(1000);
  } 
  plugin::return_items(\%itemcount);
}