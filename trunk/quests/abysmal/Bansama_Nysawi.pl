sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("smiles at you and says");
    quest::say("Hello. It's always nice to have visitors, especially with all the work we have to do around here. I'm grateful for the chance to take a break and talk. Of course the work we do is important, so I can't spend too much time talking.' Bansama looks at you for a moment, 'Maybe you could help me get some [work] done?");
  }
  if ($text=~/word/i) {
    quest::say("Imildu and I are busy keeping the Wayfarers supplied with the arrows, bows and other supplies they need to battle their enemies. The thing is, we've discovered some very odd stone that I would love to have time to research. They find it only in the mountains, and it has a very unpleasant feeling to it. I really want to talk to Nedaria about this. This stone seems similar to the material that the Grozmok Stone is made out of, though I can't be certain, only Nedaria could determine that. I've been calling this stone [Discord Stone] just because of the unusual properties it has. I have been able to work with it with some good results, but I'd like to have more time at it. If you could handle some of my other [duties] that might help. If you help me out enough, I can teach you the secret for preparing both Taelosian Rock and the Discordian Rock that Imildu and I came up with.");
  }
  if ($text=~/duties/i) {
     quest::say("'I have many duties to perform before I can be free to do as I wish. If you can help me with them, I would be grateful. In order to get these tasks done, though, I'll need Taelosian Stone. If you can acquire some from Imildu and bring it to me, I can put you to work. If you work hard enough I will give you the secret for working with a Chunk of Taelosian Rock and a Chunk of Discordian Rock that Imildu and I discovered. And because I am asking you to provide the material for these tasks, I can reward you sooner than Imildu will.");
    
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58151 => 1) && quest::istaskactivityactive(173,0)) {
  quest::say("Wonderful! I need some honing stones for our work. Just take a Small Taelosian Stone and a Simple Iron File and use your fletching kit to combine them. These files are not very good, and the stone is hard. So you'll need a new one with each attempt. Bring me the honing stones when you have them ready.");
  quest::summonitem(58103,10);
  quest::summonitem(58142,10);
  
}
  if (plugin::check_handin(\%itemcount, 58151 => 1) && quest::istaskactivityactive(173,1)) {
    quest::say("Fantastic! I can use your help. I need some simple arrowheads made from the Taelosian Stone. This will be good practice for you, too. Just take a Small Taelosian Stone, a Simple Iron File, and a Simple Iron Chisel and combine them in your fletching kit. The file and the chisel won't survive the work, but that's acceptable. Please bring the arrowheads to me when you are done. We have a lot archers that need them.");
    quest::summonitem(58103,10);
    quest::summonitem(58142,10);
    quest::summonitem(58102,10);
 }
  if (plugin::check_handin(\%itemcount, 58151 => 1) && quest::istaskactivityactive(173,2)) {
  quest::say("I think you can handle a more difficult task now. There is some delicate work required to make the jagged arrowheads that our scouts prefer, but you can do it. Just take the Small Taelosian Stone and Simple Tiny Chisel and combine them in your fletching kit. Bring them to me when you have them done. Thank you.");
  quest::summonitem(58142,10);
  quest::summonitem(58129,10);
  }
  if (plugin::check_handin(\%itemcount, 58151 => 1) && quest::istaskactivityactive(173,3)) {
  quest::say("Hello! Thank you for helping out. I need some veined arrowheads. They are very effective against certain targets. Take the Small Taelosian Stone, Simple Iron Chisel and Basic Etching Compound and put them into your fletching kit. It's a complicated task, but you can manage. Bring the finished arrowheads to me.");
  quest::summonitem(58142,10);
  quest::summonitem(58129,10);
  quest::summonitem(58021,10);
  }
  if (plugin::check_handin(\%itemcount, 58028 =>1 )) {
    quest::summonitem(58036,2);
  }
  plugin::return_items(\%itemcount);
  }
  
  