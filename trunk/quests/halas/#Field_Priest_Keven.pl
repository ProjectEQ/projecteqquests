#BeginFile: halas\#Field_Priest_Keven.pl
#
#Quest: Newbie Beast Armor
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, I am the guild master.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18847 => 1)) { #Tattered Note
    quest::summonitem(13574); #Soiled Gray Tunic
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:halas  ID:Not_Found -- #Field_Priest_Keven