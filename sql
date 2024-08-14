create table Services(service_id number(3) primary key check(length(service_id)=3),
    cid_encrypted varchar(50) not null,date varchar(40),type_of_service varchar(60), vendor varchar(40),
    address varchar(100),amount integer(7),foreign key(cid_encrypted)
    references ServiceCustomer(cid_encrypted));
    
    
drop table Services;
select * from Services;

select * from ServiceCustomer;


Select * from Services where cid_encrypted = "g8g62ei3g5271h6i32h04i0407993280";