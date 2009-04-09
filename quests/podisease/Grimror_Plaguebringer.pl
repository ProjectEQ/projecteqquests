sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Grimror no have time ta talk. Gots stuffs ta do.");
 }
 if($text =~ /stuffs/i) {
	quest::say("I wuz sent here by Zulort to, err. . . To gadder some alchemy type stuffs. Him have big plan, and need me to travel lots.");
 }
 if($text =~ /big plan/i) {
	quest::emote("laughs. 'Me not tell you dat! Grimror keep secrets secret. You gonna help Grimror or no?'");
 }
 if($text =~ /help Grimror/i) {
	quest::say("Dat good!");
	quest::say("Grimror been getting compon ents for dayz now and Grimror still not finushed. You gonna get dem tings fur me?");
 }
 if($text =~ /dem tings/i) {
	quest::say("Grimror need bile, dat stuff es strong here! But Grimror keent seem to git eet all. Bile comz from da leetle bugs. Keel little bugs, and geeve Grimror dere leetel bodiez and Grimror give yuuz anyting dat yuuz want. Dere on four leetel buggiez dat Grimror still neez, two uf dem come from da fliez, one comez from da wurmiez, and one comez from the moss-skeeterz. Yuuz bring Grimror dere lavas and Grimror geeve yuuz, and yuuz freends, anyting yuuz want");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 9290 => 1, 9291 => 1, 9292 => 1, 9293 => 1)){
    quest::say("Yuuz dun guud! But Grimror keent geeve you anyting, but Grimror have dis. Grimror also have seekret information. Krypt of Deekay in in here. Dunt tink yuuz wanna go in dere. Dere be mean old rotten keengs in dere, yuuz dunt want ta mess wif dem, dere also be udder sortz uf baddies in dere, be carefuul if yuuz goin dat way. I hurd stories dat Bertoshulus es in dere too, Grimror even saw him in here one time. In dis place yuuz only gots ta worry about Grummus, him fatter dan Grimror, got theek skin too. Him have key ta get inna de Krypt,but Grimror knew da seekret way een. Dat bracer keen make da portil into de Krypt tink dat yuuz belongz dere. Guud barshin!");
    quest::summonitem(9294);
    quest::set_zone_flag(200);
  }
}

