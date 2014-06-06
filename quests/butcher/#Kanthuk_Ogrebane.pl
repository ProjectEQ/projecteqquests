# Part of Ghoulbane quest

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello.");
  }
  if($text=~/Amstaf Trunolis/i) {
    quest::say("Amstaf Trunolis was a good man. I've followed into [battle] many times. We've seen many of our friends die by the sword of others.");
  }
  if($text=~/battle/i) {
    quest::emote("laughes, 'I remember the first time we charged into battle. I was so scared. My hands wouldn't stop trembling. Amstaf pulled me off to the side before the initial attack began. He held my hands within his. I saw his hands begin to glow and felt his energy pass into me. I felt [courage].'");
  }
  if($text=~/courage/i) {
    quest::say("I'll never forget what he did for me that day. He gave me the courage to continue. No one's ever done anything like that for me. I vowed that day that I'd follow him into any battle. I'd be there alongside him, no matter what. As time went on we came across an elven woman named [Ambreen].");
  }
  if($text=~/Ambreen/i) {
    quest::say("Ambreen was younger than he and I. She knew of the powers of nature. She was able to control the rain which fell from the heavens and would call upon the spirits to aide her. It was obvious that Amstaf took a liking to Ambreen. She ended up coming with is on out crusades. The last I saw of Ambreen was when we went to the snow covered lands of Everfrost. We were wander the lands when a freak [snowstorm] hit us. We were seperated from one another for quite some time.");
  }
  if($text=~/snowstorm/i) {
    quest::say("I don't know where it came from, but it was so sudden that it caught us all off guard. The snow quickly became unbearable. I tried to move to higher ground, but was unable to. I was stuck within the snowy confines. I didn't know what to do [next].");
  }
  if($text=~/next/i) {
    quest::say("As I laid there my body began to slowly freeze. I knew death was near and accepted the inevitable. Suddenly I felt something clutching at my cloak. I was being dragged upwards out of the snow. A hand pressed against my chest and began to glow. I felt energy pass into my body. Do you know [how] he had saved me?");
  }
  if($text=~/how/i) {
    quest::say("He saved my life by laying his hands upon my body. A few moments later we found Ambreen lying in the snow, her body frozen by the harsh surroundings. We lifted her up off the ground and began to look for [shelter].");
  }
  if($text=~/shelter/i) {
    quest::say("We ended up taking refuge within a deserted cabin not to far from our location. We knew that we didn't have much time left to bring life back into her body. However, the storm didn't pass through and we knew we couldn't venture to far without the fear of freezing. I warmed the cabin and rested for some time thinking about what we were going to do. It wasn't long before my exhaustion took over. I fell into a deep [slumber] that night.");
  }
  if($text=~/slumber/i) {
    quest::say("That night I dreamt of many things. Random thoughts kept swirling around my mind. I kept seeing the image of a cloaked being and of Amstaf circled around a fire. I saw Ambreen's body convulsing above the fire as if life was being brought back to it. I don't know what happened that night. I don't even know if what i dreamt was real, but before I awoke I saw a [strange image].");
  }
  if($text=~/strange image/i) {
    quest::say("I saw Amstaf lower his head and walked away in silence. He was surronded by two beings carrying a torch. I don't know what it meant, but I swear it was so real. When I awoke both Amstaf and Ambreen were gone. Please find Llara and give this pendant to her. This pendant belonged to Amstaf. She too had a vision that night that may clear things up. If she asks where you got it from, mention my name.");
    quest::summonitem(2414);
  }
}

sub EVENT_ITEM {
  if ($itemcount {2416} == 1) {
    quest::exp(1000);
    quest::say("Ahh, I see you have spoken to Ryshon. You seem tired from your long journey. Sit with me as I tell you a tale. A tale about a true friend of mine, a great man known as [Amstaf Trunolis].");
  }
}

# Quest by mystic414

