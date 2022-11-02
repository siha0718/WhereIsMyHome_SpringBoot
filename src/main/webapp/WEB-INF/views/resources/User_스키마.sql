create table if not exists `users` (
	`userId` varchar(50) not null PRIMARY KEY,
    `userPwd` varchar(30) not null,
    `userName` varchar(50) not null,
    `emailid` varchar(50) not null,
    `emailDomain` varchar(50) not null,
    `joinDate` date
);



