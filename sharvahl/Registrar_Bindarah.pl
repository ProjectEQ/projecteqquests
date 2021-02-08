## Changes by Kagehi.
## $Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
## Since we don't want to hand people things that they can't normally get, or
## stuff they haven't earned, we need to track which stage in the quest they
## are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
## 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
## and 7 = Initiate's Cloak.
# items: 2874, 18299, 2897, 2877, 2873, 2875, 2876, 18304

sub EVENT_SAY {
  ## Non-canon fixmes. Note: One issue with these is that they will say the text, even if you
  ## have the item. At some point someone might consider changing the guildmasters and the
  ## others to first check if you are already carrying the items.
  if(($text=~/certificate/i) && ($qglobals{Shar_Vahl_Cit} == 2)){
    quest::say("Luckily for you, someone found this blowing around the plaza.");
    quest::summonitem(2874);}
  if(($text=~/note/i) && ($qglobals{Shar_Vahl_Cit} == 4)){
    quest::say("Luckily for you, someone found this stuck in a bush.");
    quest::summonitem(18299);}
  if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 6)){
    quest::say("Luckily for you, someone found this on the floor in the bakery.");
    quest::summonitem(2897);}
  if(($text=~/acrylia slate/i) && ($qglobals{Shar_Vahl_Cit} => 6)){
    ## No idea what she says here, so won't bother.
    quest::summonitem(2877);}
  }

sub EVENT_ITEM
{
  if(plugin::check_handin(\%itemcount, 2873 => 1))
  {
    quest::say("Young $name, I will be happy to process your registration for you. While I etch your name on our people's book of records I will require you to run a couple of errands. Take this certificate to the tax collector and obtain his seal. While you're out doing that, have Mignah create your personal Acrylia slate for you. Bring both the seal and the slate to me as soon as you can.");
    quest::ding();
    quest::exp(300);
    # Certificate of Taxability
    quest::summonitem("2874");
    quest::setglobal("Shar_Vahl_Cit",2,5,"F");
  }

  # Stamped Certificate of Taxability & Acrylia Slate
  elsif(plugin::check_handin(\%itemcount, 2875 => 1, 2876 => 1))
  {
    quest::say("Ahh, there you are. I was about to send someone looking for you. Everything seems to be in order here, only one task remains. You must gain audience with the king and swear fealty to his highness by handing him this document. Return to me when this is done.");
    quest::ding();
    quest::exp(300);
    # Note to King Raja
    quest::setglobal("Shar_Vahl_Cit",4,5,"F");
    quest::summonitem("18299");
  }

  # Note from King Raja
  elsif(plugin::check_handin(\%itemcount, 18304 => 1))
  {
    quest::say("Well done, $name, I am honored to be the first to welcome you to citizenship of Shar Vahl! May you serve our society as well as it serves you. Return to your guildmaster and present both the slate and the application to him. The acrylia slate shall henceforth serve as proof of your citizenship.");

    # Acrylia Slate of Shar Vahl
    quest::summonitem("2877");
    # Notarized Application
    quest::summonitem("2897");
    quest::setglobal("Shar_Vahl_Cit",6,5,"F");

    quest::say("Oh, by the way, be careful with this as it will be important for recording your service to our society. If you should somehow lose it, ask me about your slate and I will issue you a new one.");
    quest::ding();
    # Citizens of Sharvahl
    quest::faction(1584,400); # Faction: Citizens of Shar Vahl
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE ZONE:sharvahl ID:155078 -- Registrar_Bindarah
