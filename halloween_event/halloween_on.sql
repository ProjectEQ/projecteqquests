update npc_types set race = 82,size = 6,texture = 1,gender = 2 where  id > 201999 and id < 202100 and bodytype not in (11,60,66,67);
update npc_types set race = 60,size = 6,texture = 1,gender = 2 where  id > 202099 and id < 202200 and bodytype not in (11,60,66,67);
update npc_types set race = 14,size = 6,texture = 1,gender = 2 where  id > 202199 and id < 202300 and bodytype not in (11,60,66,67);
update npc_types set race = 85,size = 6,texture = 1,gender = 2 where  id > 202299 and id < 202384 and bodytype not in (11,60,66,67);
update npc_types set race = 14,size = 6,texture = 1,gender = 2 where  class = 41 and id > 201999 and id < 202100 and bodytype not in (11,60,66,67);

update npc_types set race = 85,size = 6,texture = 1,gender = 2 where  id > 150999 and id < 151014 and bodytype not in (11,60,66,67);
update npc_types set race = 14,size = 6,texture = 1,gender = 2 where  id > 151013 and id < 151027 and bodytype not in (11,60,66,67);
update npc_types set race = 60,size = 6,texture = 1,gender = 2 where  id > 151026 and id < 151041 and bodytype not in (11,60,66,67);
update npc_types set race = 82,size = 6,texture = 1,gender = 2 where  id > 151040 and id < 152000 and bodytype not in (11,60,66,67);

update npc_types set race = 85,size = 6,texture = 1,gender = 2 where  id > 151999 and id < 152006 and bodytype not in (11,60,66,67);
update npc_types set race = 14,size = 6,texture = 1,gender = 2 where  id > 152005 and id < 152012 and bodytype not in (11,60,66,67);
update npc_types set race = 60,size = 6,texture = 1,gender = 2 where  id > 152011 and id < 152018 and bodytype not in (11,60,66,67);
update npc_types set race = 82,size = 6,texture = 1,gender = 2 where  id > 152017 and id < 153000 and bodytype not in (11,60,66,67);

update npc_types set race = 85,size = 6,texture = 1,gender = 2 where  id > 343999 and id < 344004 and bodytype not in (11,60,66,67);
update npc_types set race = 14,size = 6,texture = 1,gender = 2 where  id > 344003 and id < 344008 and bodytype not in (11,60,66,67);
update npc_types set race = 60,size = 6,texture = 1,gender = 2 where  id > 344007 and id < 344012 and bodytype not in (11,60,66,67);
update npc_types set race = 82,size = 6,texture = 1,gender = 2 where  id > 344011 and id < 345000 and bodytype not in (11,60,66,67);

update npc_types set race = 14,size = 6,texture = 1,gender = 2 where  lastname = 'Soulbinder' and id < 51000;
update npc_types set race = 60,size = 6,texture = 1,gender = 2 where  lastname = 'Soulbinder' and id > 50999 and id < 101000;
update npc_types set race = 82,size = 6,texture = 1,gender = 2 where  lastname = 'Soulbinder' and id > 100999 and id < 151000;
update npc_types set race = 85,size = 6,texture = 1,gender = 2 where  lastname = 'Soulbinder' and id > 150999;

update npc_types set race = 367,size = 6,texture = 1,gender = 2 where  name = 'Priest_of_Discord';

update spawn2 set enabled = 1 where id in (59022,59023,59024,59025,59026,59027,59028,59029,59030,59031,59032,59033,59034,59035,59036,137086,137087,137088,137433,137434,137435,137449,137450,137462,137481,137482,137483,142515,142589);
update spawn2 set enabled = 1 where id > 137088 and id < 137111;
update spawn2 set enabled = 1 where id > 137416 and id < 137433;
update spawn2 set enabled = 1 where id > 137435 and id < 137450;
update spawn2 set enabled = 1 where id > 137450 and id < 137462;
update spawn2 set enabled = 1 where id > 137462 and id < 137481;
update spawn2 set enabled = 1 where id > 137483 and id < 137504;
update spawn2 set enabled = 1 where id > 142495 and id < 142515;
update spawn2 set enabled = 1 where id > 142531 and id < 142575;
update spawn2 set enabled = 1 where id > 142576 and id < 142589;

delete from quest_globals where name like 'halloween%';
