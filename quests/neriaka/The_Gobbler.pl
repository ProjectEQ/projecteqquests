sub EVENT_SAY {
  if ($text=~/hail/i) {
  quest::say("'Meat!! You need meat. Me gots meat!! High elf meat, dwarf meat, human meat, [HEHE meat], [froggy legs]. Me got a lot.");
    
  }
  if ($text=~/HEHE meat/i) {
    quest::say("HEHE meat? It human, Erudite 'n high elf, mashed together. Mmmm. Very tasty!");
  }
  if ($text=~/froggy legs/i) {
    quest::say("'Froggy legs come from far away. Me get from friend, [Chef Dooga]. It not tasty. Trolls like it. Eat it up much. They eat too much froggy. Me glad [Nerbilik] leave Neriak!! He eat way too much froggy.");
  }
  if ($text=~/Chef Dooga/i) {
    quest::say("'Friend in Oggok is Chef Dooga. Chef she is. Used to work in Neriak. She beautiful. She supply the Gobbler with [froglok legs]. They very low now. Fat trolls eat too many!! Me need to [pick up froglok legs].");
  }
  if ($text=~/pick up froglok legs/i) {
    quest::say("'That good news. Oggok far away. Me got no time to go. If you go speak to Chef Dooga, say you pick up froglok legs. You bring back and me give you coin, maybe even something good.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13384 => 1)) {
    quest::say("Uggh!! Froglok legs!! Me hate smelly legs, but me need it for fat trolls.");
    quest::faction( 378, 25);
    quest::exp(150);
    quest::summonitem(13386);
  }
}