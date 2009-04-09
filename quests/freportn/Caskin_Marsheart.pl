
sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 18747 => 1)){
	quest::say("Welcome to the guild. here's your guild tunic. Now. let's get to work.");
	quest::summonitem("13571");
	quest::faction("322","1");
	quest::faction("165","-1");
	quest::faction("149","-1");
	quest::faction("316","1");
 }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8066 -- Caskin_Marsheart 

