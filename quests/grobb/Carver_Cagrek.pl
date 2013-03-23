sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Away from carver Cagrek you get!! Me's a busy troll. Must punish enmees of Grobb and feeds trolls a plenty. Trolls complain meats no good, complains dey want sum [special bread]. Dey says dey hears ogres have special meat which taste better den pris'ners of Grobb. Do you knows name of meat? What kinda [meat] dat be? Tell me!!");
  }
  if ($text=~/special bread/i) {
    quest::say("It little known secret among trolls dat Cagrek know how to make tatsy bread from halfling. Dey say dere is plenty of dem out in the forest, ripe for the picking!! You bring carver Cagrek four of their tender little feet bones.");
  }
  if ($text=~/hehe meat/i) {
   quest::say("HEHE meat!! What dat stand for? Mes need some of dis HEHE meat!! Gos and get me some. Cagrek not just want some. Cagrek want more dan twenny!! Cagrek want three HEHE meat and mes want HEHE recipe. You get and me makes $name honeraree carver. Me gives you Grobb Cleaver. It cuts skins like dey butter!!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 16183 => 4)) {
    quest::say("Whut tooks you so long!! Ah, dis please Cagrek as I can grind dese up to make special bread. Me get on that right away. Here is you reward, now out of Cagrek's way.");
    quest::summonitem(28243);
    quest::faction(131, 15);
  }
  elsif (plugin::check_handin(\%itemcount, 13368 => 3, 18940 => 1)) {
    quest::say("Finally!! What takes yous so long? Now carver Cagrek try and makes meat and feeds to trolls. Yous getting to be deputy carver. Mes give you Grobb cleaver!! Make strong and smarts on you it will. Just like carver Cagrek.");
    quest::summonitem(5413);
  }
  else {
    quest::say("Me no need dis."); #Text made up
  }
  plugin::return_items(\%itemcount);
}