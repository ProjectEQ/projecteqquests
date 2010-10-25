#File: /nedaria/Tavon_Vastsea.pl
#Quest: Cleric Epic 1.5 Prequest, 1.5, 2.0

sub EVENT_SAY {
  if(plugin::check_hasitem($client, 9955) && plugin::check_hasitem($client, 5532)) { #9955 Harmony of the Soul, #5532 Water Sprinker of Nem Ankh
    if($text=~/hail/i) {
      quest::say("I hear you were able to put that shield to some use. That is good to hear. I was able to find some news on the leader, someone matching his description has been seen on the other side of the Wayfarer's portal in the Realm of Discord. Please visit my friend Cryssa, at the camp in Discord. She has been working on tracking the Disciple's movement in Discord");
    }
  }
  elsif(plugin::check_hasitem($client, 5532)) { #5532 Water Sprinkler of Nem Ankh
    if($text=~/hail/i) {
      quest::say("Greetings $name, I see you helped my brother in eradicating the Plasmatic Priests, stopping Zordak Ragefire, and saved Norrath from an eternity of flames. We need to [call] you to [duty] again.");
    }
    if($text=~/call/i && $text=~/duty/i) {
      quest::say("We don't know much more about them. As I said, they are just whispers, but whispers in unison are loud enough for deaf ears. We cannot afford to present anything short of a unified front, should the Legion push forward toward Norrath with its full force. We need your assistance to find and exterminate these traitors. I can give you what little [information] I have, hopefully you will be able to track these betrayers to their leader.");
    }
    if($text=~/information/i) {
      quest::say("Travel to Taelosia. There you will find a young native, named Jomaj who has some suspicious dealings with someone claiming they were with the wayfarer's brotherhood. This is the closest I have to direction, gather information from this Taelosian, and bring it to my friend Shav on the Thorn. Find proof as to whether or not these traitors actually exist and return it to me.");
    }
  }
  else {
    if($text=~/hail/i) {
      quest::say("Greetings $name. I am afraid that I need someone that I can [trust] with this task, these are dark times, and it is hard to tell friend from foe.");
    }
    if($text=~/trust/i) {
      quest::say("Hmm, well I think I have a task I can entrust you with. Speak to my brother, tell him that I have sent you to him. Earn his trust, and you shall have mine.");
    }
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 9585 => 1)) { #9585 Magically Sealed Letter
    quest::emote("The seal on this letter vanishes as Tavon whispers into it. He opens the envelope and pulls out a short letter, his brow furrows as his eyes dance across the pages. 'This is truly grim news. Until now I held hopes that the rumors held no truth, but this is irrefutable evidence of their existence. They call themselves the Disciples of Discord. As we speak they are gaining information for the Legion, gathering information about races that would prove to be powerful allies or enemies for the Legion. Bring this note to Plavo, I don't know where he is, but he must be found. His scouts may already have found what they are looking for, so make haste.'");
    quest::exp(10000);
    quest::summonitem(9591); #9591 Dark Disciples Note of Service
  }
  elsif(plugin::check_handin(\%itemcount, 9954 => 1)) { #9954 Aegis of Chaotic Worship
    quest::say("Interesting, I heard about your fight with the leader of the Disciples. I've never seen anything like this. Take it to Borik Darkanvil in the Plane of Knowledge. Return to me when you are done with him, in the meantime I will try to find information on where he went after your fight.");
    quest::summonitem(9954); #9954 Aegis of Chaotic Worship
  }
  else {
    quest::say("I have no need for this.");
    plugin::return_items(\%itemcount);
  }
}