#Zone: Iceclad Ocean
#Short Name: iceclad
#Zone ID: 110
#
#NPC Name: a lost pirate
#NPC ID: 110057
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("twitches and growls a little.");
    quest::say("Arrr. Grrr. Ahoy, mate. The name's Teep.");
    quest::emote("shivers and you notice a little drool at the corner of his mouth.");
    quest::say("Ya ain't lost out here too, are ya?");
  }
  if ($text=~/not lost/i) {
    quest::emote("grins and stares through you with a mad gleam in his eye.");
    quest::say("Hehehe. Yah, yer lost aren't ya. I can tell from the crazy sound o' yer voice. Too bad we ain't got me map. The map would lead us straight back ta camp. Yah, that it would, boyo.");
  }
  if ($text=~/map/i) {
    quest::emote("nods.");
    quest::say("After we got ourselves stuck on this island I got it in me head to draw up a map so none o' the crew would ever get lost. So I set myself to explorin' and drawin'. Now the map is gone. Too bad, too, cause it was a map o' the whole place, not just the first island, but a bunch o' parts.");
    quest::echo("Mention of the map seems to have sobered him up a bit.");
  }
  if ($text=~/gone/i) {
    quest::say("Aye. I lost the first part walkin' through the woods. Some big wolf bowled me over 'n started to tear me book up. 'Fore I could stop, it he ran off. I'm not knowin' why. The second part, heh. That was worse.");
  }
  if ($text=~/second part/i) {
    quest::emote("shivers.");
    quest::say("The second piece I lost. Well, that put the fear o' Bertox in me. I was still in the woods at the time. It was at night. Cold and crisp, it was. I heard a flappin' and squawkin' above me and I knew my time was near. So I up and jumped into a snow drift. Soon as that, somethin' swooped down where I was and started tearin' my camp up. When I came back, I saw nothin' but feathers and me torn up book. Another quarter o' me book was gone.");
  }
  if ($text=~/third part/i) {
    quest::say("Huh? Oh, the other pieces? I gave a piece to a mate o' mine 'cause he wanted to help. Nice enough fella but he couldn't find north from a hole in the hull. Last I saw he wandered off towards the bridge. The last piece went away after I stumbled and fell down here. After a while I didn't care, so I threw it in the water. It floated off. Seems like everythin' that goes wrong ta me is because of some danged wild animal. I can't quite figger it.");
  }
  if ($text=~/i will find the parts/i) {
    quest::emote("laughs.");
    quest::say("Its yer funeral, boyo. I'm not even sure they're readable. Oh, well. Here, take this. It's the cover of the book I was puttin' the map in. If ya get the first four parts, put em in there. If ya get the fifth, just go give it ta Ami the way ya find it. Hey, if ya find em all, come get me so I can find me way back. I'm thinkin' I'd like ta go back now.");
    quest::summonitem(17053);
  }
  if ($text=~/chapter p/i) {
    quest::emote("stares at the water");
    quest::say("I'm rememberin' that. Yah. Ami's book. Thats what I drew, erm, the fifth part o'n. It got lost in the ocean too.' He looks at you. 'Yer wantin' ta go out and find all o' these pieces?");
  }
}

sub EVENT_ITEM {
  if ($itemcount{30046} == 1) {
    quest::emote("grins widely and slaps you on the arm.");
    quest::say("Har har! You're crazier than I am. And since I know that I must not be that crazy after all. Ahh, I haven't felt this good in ages..' He shuffles the pieces and jots down a few notes here and there. 'There, now it's really finished. Let's get us outta here. Hold this fer me.");
    quest::echo("As he starts to try and crawl up the hill, a sleek figure darts towards him.");
    quest::exp(50000);
    quest::summonitem(30047);
    my $entid = quest::spawn2(116008,0,0,1002,6354,-32.09,65); #rabid snow cougar does not exist using regular for now
    my $mob = $entity_list->GetMobID($entid);
    my $mobnpc = $mob->CastToNPC();
    $mobnpc->AddToHateList($npc, 1);
  }
}

#END of FILE Zone: iceclad  ID:110057 -- a_lost_pirate

