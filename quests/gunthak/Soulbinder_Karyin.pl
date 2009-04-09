#generic soulbinder quest
sub EVENT_SAY { 
	plugin::soulbinder_say($text);
}


sub EVENT_SPAWN
{
  quest::delglobal("Alina");
  quest::setglobal("Alina",2,3,"F");
  $Alina=undef;
}
#END of FILE Zone:gunthak  ID:90964 -- Soulbinder_Karyin 

