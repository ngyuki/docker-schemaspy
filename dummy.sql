drop table if exists t2;
drop table if exists t1;

create table t1 (
    id int not null primary key
);

create table t2 (
    id int not null primary key,
    foreign key ( id ) references t1 ( id ) on update cascade on delete cascade
);
