sub EVENT_SAY {
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/elder spirit sent me/i) {
  quest::say("Yous sent by spirit? Me surprised it send so quick. Me no time to get da shrub yets. Yous will needs to get three of dem. Da shrub only grow nearby in only few spots. Gib dem to me when yous nab dem.");
}
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 57080 =>3 )) {
    quest::say("Me proud! Now you must protect dat for da spirit. It need it badly. You be careful. Dere might be some baddies out dere dat may want to take dat from you. Spirit said dere are evils working against us. I hab tied da shrub for you so dat it don't get ruined.");
    quest::summonitem(52920);
  }
  plugin::return_items(\%itemcount);
}