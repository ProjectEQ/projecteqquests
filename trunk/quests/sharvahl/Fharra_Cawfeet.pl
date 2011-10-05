#Shar Vahl - Fharra Cawfeet - created by anubisrwml


sub EVENT_SAY {

if ($text=~/Hail/i){
quest::say("Greetings. Is there something I can help you with?"); }

if ($text=~/told/i){
quest::say("I was called to this house a few days ago, because several members of a recent scouting group have been running slight fevers. The fever is nothing that should alarm you but we will need to tend to them. Tending to the sick is one of our duties as Dar Khura. Would you be [willing] to run some errands for me? I cannot leave these scouts unattended."); }

if ($text=~/willing/i){
quest::say("I need you to make a tonic to help aleviate their fevers. Please head into the cavern system just beyond the thicket. Gather the hearts of muck diggers that roam those caverns. Their hearts seem to regulate the temperature of their body and can be used in potions and tonics to control temperature in a similar fashion. Brew two of those hearts with a flask of water and it should produce the tonic I need. Please, fill a blackened clay jar with tonic. Try to make it back before I fall over from exhaustion."); }
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 3495 => 1)) {
quest::emote("looks like she has been awake for many hours. She looks up and says 'Are you here to assist me with these sick citizens? I was told that a few of our newest Dar Khura recruits might be coming to aid me. I could definitly use the help. Here, take the jar while I explain. Were you told about the [tasks] that I need help with?' The room is filled with the smell of aromatic herbs and the sweat of the feverish.");
quest::summonitem(3495);
quest::summonitem(17077); }

if (plugin::check_handin(\%itemcount, 5536 => 1)) {
quest::emote("perks up when you hand her the jar. 'Many thanks,' she exlaims, as she digs in her medicine bag.");
quest::say("Your assistance is greatly appreciated. Please take this tincture. It will help to strengthen your buckler. Mydi Darjik can help you apply it. She is a friend and a wonderful alchemist. Tell her that you need her to [treat] your buckler. Take care, $name!");
quest::summonitem(5537); }

plugin::return_items(\%itemcount);
}
