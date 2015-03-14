sub EVENT_SAY {
  if($text=~/Hail/i && $qglobals{pop_cod_preflag} == 1) {
    quest::say("You believe you can [" . quest::saylink("challenge Bertoxxulous") . "], mortal?");
  }
  if($text=~/Challenge Bertoxxulous/i && $qglobals{pop_cod_preflag} == 1) {
    quest::say("Give the Crypt Lord my regards");
    quest::movepc(200,0,-16,-289,128);
  }
}
