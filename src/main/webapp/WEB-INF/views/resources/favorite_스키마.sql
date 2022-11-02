create table if not exists `favorite` (
	`favorite_userId` varchar(50) not null ,
    `sidoName` varchar(50) not null,
    `gugunName` varchar(50) not null,
    `dongName` varchar(50) not null,
    `favorite_dongCode` varchar(50) not null,
		foreign key (`favorite_userId`)
        REFERENCES  `users` (`userId`)
        on delete cascade
        on update cascade,
		foreign key (`favorite_dongCode`)
        REFERENCES  `dongcode` (`dongCode`)
        on delete cascade
        on update cascade
);
