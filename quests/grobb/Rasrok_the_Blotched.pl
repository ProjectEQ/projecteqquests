sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, yerself. What you want? Youse shud know dat youse talkin to a hee-ro. Me give many peeples [nightmares] and dat make Cazic-Thule happy soes he tooks me to da [Realm of Heroes]. I live dere a long time but now me back here agin. My job iz ta reward dose dat urned favor in da eyes of da gods.");
  }
  if($text=~/nightmares/i) {
    quest::say("Dis a long story but I like tellin it cuz it about me. Trolls is gud cooks but youse need da right ingredients to make da really gud stuff. Meez always liked da taste of dem [high elves] da best so meez went to where day live over on Faydwer. Sometimes day hard to catch and day get away. Den day bring back dair friends and try to git you and dats bad.");
  }
  if($text=~/high elves/i) {
    quest::say("Uh-huh. Day taste da best all right. Tink it is cuz day eat so many vegetables and stuff. Makes dem taste kinda like a rabbit. Soes anyway, meez saw one alone one day so meez run it down and kills it good. But it weren't a high elf. It wuz really one of dem dark elves dat had a [ring] dat made him look like one of dem udder elves. I ates him anyway but he wuz kinda stringy.");
  }
  if($text=~/ring/i) {
    quest::say("Yup. Soes meez gots dis ring and I can use it ta look like one of dem high elves. Meez thought it wuz a good way to git dem. Soes I walk around in dair villages and stuff for a while and thought about all dem tasty elves. But meez had a [problem]. Even though I could get close to dem lookin like day do, day wouldn't follow me away from dair towns soes I could eat dem.");
  }
  if($text=~/problem/i) {
    quest::say("Da problem is dat dose elves talk in a funny accent. Day would look at me funny when I talks to dem. Soes this is what meez do. I looked fer one of da smart ones ta leave from his shop one night and I caught him but didn't eat him. I took him back to da [cave] I was stayin in. I kept da ring on still but meez told him I wanted him to learn meez to talk like da udder elves. After learnin me dat, meez said meez would let him go.");
  }
  if($text=~/cave/i) {
    quest::say("Soes he learn me ta talk like da elves do. Took a few months but I learned it. I figgered it was worth all da effort since meez would have all da high elf meat meez could want after dat. After meez tink he did a good job at teachin me to talk like da udder elves, meez ate him. Want meez ta [show you how] dose elves talk over dere?");
  }
  if($text=~/show/i) {
    quest::say("Day go like dis. . . 'How are you gentlemen!!! It is a fine day today you must agree. Would you care to have a look at my wares? Perhaps you would be interested in purchasing one of my savory meat pies.' Day are stoopid like dat. Meez could say enough tings like dem dat day weren't no longer scared. Soes what I did next wuz what [started] meez on da [path] dat urned me da favor of Cazic-Thule.");
  }
  if($text=~/shop near kelethin/i) {
    quest::say("Meez made a lot of money in dat little shop sellin da meat pies I made outta all da elves. Udders like da humies and dorfs started ta come to meez shop ta buy da meat pies too. Everybody loved da meat pies and thought day was good. So many peeples wer commin ta meez shop dat I had ta [step up production]. Troll cookin is da best cookin, course day thought meez was a high elf.");
  }
  if($text=~/step up production/i) {
    quest::say("Yeah. Meez needed lots more meat soes I could fills all da orders. Pretty soon though, peeples started ta notice all da missing elves and started gettin worried. Da streets of Felwithe started lookin kinda empty actually. Da stoopid elves thought it was vampires from Castle Mistmoore dat was takin peeple. Anyways, meez had ta lower da standards and started mixin in some wood elf and even humie and dorf once in a while. But it still wasn't [enough].");
  }
  if($text=~/enough/i) {
    quest::say("Usually meez go out and get da fresh meat I needed fer da pies but I came up with a better idea. Meez stay open late and let da meat come to me! Dat way meez need to hunt less and could spend more time at da shop cookin up da pies. Dat worked good for a while. Something [bad] happened one night though.");
  }
  if($text=~/bad/i) {
    quest::say("It was late in da night and dis dorf came stumblin into da shop. He was real drunk and I thoughts he might add a tangy zip to da pies with all da liquor in em. Soes when he turns around I swung meez cleaver to take his ugly head off but it broke when it hit sumthin hard around dis dorf's neck. Come to find out da dorf has dis big [iron collar] around his neck. Of course, he starts screaming like a dorf.");
  }
  if($text=~/iron collar/i) {
    quest::say("Yeah. Some stoopid peeple dat thought it was vampires started wearin dese big iron collars around dair necks at night to keep from bein bit. So I gots dis dorf bellowing all loud soes I put my hand over his head and tries to smother him. Dem dorfs are pretty tough. He bit meez finger clean off. Turn out ta be da finger dat had da ring on it. So now da dorf knows meez am a troll and he start yellin even louder. Den meez started hearin [voices coming] toward da shop.");
  }
  if($text=~/voices coming/i) {
    quest::say("Da dorf attracted a lot of attention with all his yellin. A pretty big crowd showed up so meez started runnin. Since day no like da trolls, day was pretty mad. I got away okay but all dem wizards and druids and magicians day got over dere burnt me up pretty good. Dats why I have all dese nice blotchy scars. [What happened next] was da best part. Cazic-Thule was really happy.");
  }
  if($text=~/happened next/i) {
    quest::say("Meez was pretty popular before day knew dat meez was a troll. Everyone in Faydwer knew about da pies I made and most of dem peeples dere liked da meat pies a lot. But when day searched da shop after meez ran away. day found all da heads of da peeples dat turned up missin. Dats when day finally realized dat da missin peeple were in da pies day all liked. Dis is da [fun part] dat really got Cazic-Thule's attention.");
  }
  if($text=~/legend/i) {
    quest::say("Oh yeah. Day tell dair little elves if day ain't gud. Rasrok will come bake dem into a pie and eat dem. Some tink dat dis is only a legend told ta scare peeples. But whether day knows it's true or not, day still feed Cazic Thule with da fear caused by dat story. Heh. Meez not know what da big deal is with eatin a good pie but elves and dose udder peeples are pretty stoopid ta start with.");
  }
  if($text=~/realm of heroes/i) {
quest::say("Yeah dat iz where meez from. Well. . . First meez wuz from here den meez wuz from dere and now meez back here agin. When peeples from here do sumthin heero-ick sumtimes day get a coin fer dair deeds. Youse give me one of dem coins and meez give you sumthin good dat wurthy for a hee-ro. Maybe youse get a trip to da Realm of Heroes yerself sum day.");
  }
}

sub EVENT_ITEM {
  quest::say("Me not want diz.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:grobb  ID:6085 -- Rasrok_the_Blotched