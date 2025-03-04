create user 'web-server'@'10.0.0.2' identified by 'web-secure-password';

grant all privileges on *.* to 'web-server'@'10.0.0.2' with grant option;

flush privileges;

create database server_management;

create table users(
    id int auto_increment primary key,
    username varchar(50) unique not null,
    password_hash varchar(32) not null,
    role enum('admin', 'user') default 'user',
    created_at timestamp default current_timestamp,
    last_login timestamp null,
    failed_logins int default 0,
    account_status enum('active', 'locked', 'inactive') default 'active'
);

create table server_logs(
    id int auto_increment primary key,
    server_name varchar(100) not null,
    log_type enum('info', 'warning', 'error') not null,
    message text not null,
    log_time timestamp default current_timestamp
);

create table server_health(
    id int auto_increment primary key,
    server_name varchar(100) not null,
    cpu_usage decimal(5, 2),
    memory_usage decimal(5, 2),
    disk_usage decimal(5, 2),
    health_status enum('healthy', 'warning', 'critical') default 'healthy',
    recorded_at timestamp default current_timestamp
);

create table login_attempts(
    id int auto_increment primary key,
    user_id int,
    attempt_time timestamp default current_timestamp,
    success boolean default false,
    foreign key (user_id) references users(id) on delete cascade
);

insert into users(username, password_hash, role) values("admin", MD5('admin'), 'admin');
