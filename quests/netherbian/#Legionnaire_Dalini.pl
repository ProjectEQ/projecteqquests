# Earring of Veracity #1 (Insignia)
# Sanctus Seru : torsten reidan
# Marus Seru : reothe
# Netherbian Lair : Legionnaire Dalini, spawned Bregun Dorey

sub EVENT_SAY{
  if ($text=~/Bregun Dorey/i){
    quest::say("Yeah maybe I know Bregun. You know, I sure am thirsty with all this guard work I am doing. I know what I want, some Dawnshroud Cider! Yeah, go fetch me a cider and we will see if I remember anything when you get back.");
  }
}

sub EVENT_ITEM{
  if (plugin::check_handin(\%itemcount,29851=>1)) { # dawnshroud cider
    quest::say("Dorey usually roams in the troglodyte caves, you might find him there.");
    # spawns bregun dorey, near a trog hunter
    quest::unique_spawn(161077,0,0,-372,-95,10,88);
  }
  
  plugin::return_items(\%itemcount);
}

