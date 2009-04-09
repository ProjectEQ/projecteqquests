#Aid_Garuuk.pl
#Hoop of the Traveller


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hullo traveler, an' welcum ta New Tanaan. Have ya been sittin' in da library very long? Da pages contained whif'in dese walls hold many inturestin' bits uv knowledge. As aides ta da council, our job is ta help assist our represenuhtives wif da task uv cullectin' more an' more knowledge fer da library. Right now I'm busy researchin' artifacts uv power fer Srethix but I'm missin' sum books I need. An' worse den dat, all dis werk has made me late in deliverin' sum supplies ta Grobb. Do ya think you could [give me a hand] whif dat?");
  }
  
  if (($text=~/I will give you a hand/i) && ($race == 9)) {
  	quest::say("Dat wud be great! My cuzin has been lookin' fer sum new ingredients ta experuhment whif his alchemy. I wuz suppos'd ta bring him sum but I didn't have da time. If you could get a Swirling Banshee Essense, Arachnae Fangs, a Wrulon Claw, an' a Blood Raven Tailfeather, take dem ta my cuzin Bregna in Grobb. He'll be most happy ta see dem delivured.");  	
  }
  else {
  	quest::say("Umm, on secund thought, maybe you shudn't help me after all. Da trolls where I come frum aren't as kind an' undurstandin' as I am.");
  }
}
  
  
sub EVENT_ITEM {
  if((plugin::check_handin(\%itemcount, 28740 => 1)) && ($race == 9)){#Troll Receipt
    quest::say("Dank yoo $name.  Take diz.");#Text made up, I have no reference.
    quest::summonitem(2418); #Hoop of the Traveler
  }

  elsif((plugin::check_handin(\%itemcount, 28740 => 1)) && ($race != 9)){
  	quest::say("What's dis? A receipt frum a $race? You cud not have gottun dis from Bregna, dis must be a forgury. I'll keep dis so you can't fool anywun else whif dis again.");
  }
  
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
  }
    

#END of FILE Zone:poknowledge  ID:202123 -- Aid_Garuuk 

