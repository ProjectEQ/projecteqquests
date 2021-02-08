# Beer for the guards
#
# items: 19188

sub EVENT_SAY {
  
}

sub EVENT_SIGNAL {
  if ($signal == 100) {
    quest::say("Oi there, friend!");
  }
  elsif ($signal == 101) {
    quest::say("Yar, Rowle. So whadda ye say, friend? We stand around drinkin' water on duty all day, and that ain't no life fer a dwarf. Now we bin hearin' bout all these new ales and suchnot comin' up from Norrath. Ye think ye might be so kind as to share a pint and raise our spirits?");
  }
  elsif ($signal == 102) {
    quest::moveto(-1559.2,-234.9,-266.7);
    quest::doanim(1);
    quest::say("'Shhhhhh!!' He runs over and kicks Rowle in the kneecap and chuckles under his beard in your direction. Speaking under his breath to Rowle, 'Don' be such an idjit, now this lad came all the way from Norrath, why not try some of the fabled ales we'd heard our pappy's talkin' of?'");
    quest::signalwith(160207,201,0); # NPC: Rowle_Shieldson
  }
  elsif ($signal == 103) {
    quest::say("Ahhh, worthy o' Brell hisself or so they say. Ye know when I was just a pup, back before the exodus, me uncle used te talk about stompin' trolls and then sitting back with a  Boot Beer te celebrate the day's victory. I, ummm, really would be able te get in touch with me heritage were I able to sample some o' that fine stout. Ye'd be a true friend to the Validus Custodus fer helpin' us out friend. My thanks to ye in advance.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19188 => 1)) {
    quest::emote("gingerly takes the boot from you, handling it as though it were a fine porcelain. With a look of thanks to you he slowly lifts it to his lips and suddenly tips it back to empty it in one gulp, frothing his beard in the process. 'Yar! That's the ticket! Damn fine stuff that is, just like me uncle always said. A service to the Validus Custodus have ye done, my friend... And I'd be happy to assist ye in that service again sometime. HAR!'");
    quest::exp(10000);
    quest::faction(1503,10); #validus custodus
    quest::faction(1502,10); #katta castellum citizens
    quest::faction(1504,10); #magus conlegium
    quest::faction(1505,-30); #nathyn illuminious
    quest::faction(1506,-30); #coterie of the eternal night
    quest::faction(1483,-30); #seru
    quest::faction(1484,-30); #hand of seru
    quest::faction(1485,-30); #eye of seru
    quest::faction(1541,-30); #hand legionnaires
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: katta ID: 160208 NPC: Tack_Shieldson

