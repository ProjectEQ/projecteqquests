sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Wot you want, weakling? You tink you be strong [berserker]? You fight with da anger in yer heart? Me give you test. If you can do, mebbe me thinkz you be strong.");
 }
 if($text =~ /berserker./i) {
	quest::say("Dis test be to make [armor]. Grigdor be strong. Me pass test after three timez.");
 }
 if($text =~ /armor/i) {
	quest::emote("Grigdor let's out a gravelly laugh.");
     quest::say("So you tink you can pass my test? Ok. We will see. You take dis here kit. You put stuff in dere and combine it to help make Bloodwolf Armor. Grigdor can give test to make [boots], [leggings], [bracers], [gloves], a [coif], a [gorget], or a [tunic]. Only da strongest of da Trolls can make da tunic first. It be da hardest.");
     quest::summonitem(55375);
 }
 if($text =~ /boots/i) {
	quest::say("To make da Bloodwolf Boots, youz gonna need to get one low quality bear skin, one bone chips, and two small pieces of ore. Mebba youz can find animal partz out in da Nektulos Forest. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Boots Material to a forge, with dis mold to make your new boots.");
    quest::summonitem(55371);
 }
 
 if ($text=~/leggings/i) {
   quest::say("To make da Bloodwolf Leggings, youz gonna need to get three snake eggs, two Kobold Livers, a larval carapace and one small piece of ore.  Mebba youz can find animal partz out in da Nektulos Forest. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Leggings Material to a forge, with dis mold to make your new leggings.");
   quest::summonitem(55372);
 }
 
 if ($text=~/bracers/i) {
   quest::say("To make da Bloodwolf Bracer, youz gonna need to get one small piece of ore, two snake fangs, one zombie skin, and one bone chips. Mebba youz can find animal partz out in da Nektulos Forest. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Bracer Material to a forge, with dis mold to make your new bracer");
   quest::summonitem(55369);
 }
 
 if ($text=~/gloves/i) {
   quest::say("To make da Bloodwolf Gloves, youz gonna need to get one small piece of ore, two bat wings, one Halfling ulna, and one bone chips. Mebba youz can find animal partz out in da Nektulos Forest. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Gloves Material to a forge, with dis mold to make your new gloves.");
   quest::summonitem(55373);
 }
 
 if ($text=~/coif/i) {
   quest::say("To make da Bloodwolf Coif, youz gonna need to get two small pieces of ore, one ruined wolf pelt, one fire beetle eye, and one fish scales. Mebba youz can find animal partz out in da Nektulos Forest. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Coif Material to a forge, with dis mold to make your new coif.");
   quest::summonitem(55368);
 }
 
 if ($text=~/gorget/i) {
   quest::say("To make da Bloodwolf Gorget, youz gonna need to get two small pieces of ore, one ruined wolf pelt, one Halfling ulna, and one burned out lightstone. Mebba youz can find animal partz out in da Nektulos Forest. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Gorget Material to a forge, with dis mold to make your new gorget.");
   quest::summonitem(55370);
 }
 
 if ($text=~/tunic/i) {
   quest::say("Dis part be hard to make. If you tink you can do, then you need to get two Small Pieces of Ore, sum Pristine Moccasin Scales, one Burly Kobold Ear, sum Pristine Alligator Hide, and sum Moccasin Poison. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Tunic Material to a forge, with dis mold to make your new tunic. If you do dis, come back here and me have one more [test] for you.");
   quest::summonitem(55374);
 }
 
 if ($text=~/test/i) {
   quest::say("Dere still be sum frogs hidin in da swamp. Show dem your anger. Get one Pristine Froglok Eye and sum Bull Alligator Spines. Youz might need ta get some other trollz ta help youz with dis. If you get deze itemz, give dem to me and I give you final reward.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13372 =>1, 51038 =>1 )) {
    quest::say("Good job.  Here is your reward");  #ad lib text
    quest::summonitem(55376);
    quest::ding();
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}