use universty;


CREATE TABLE bank_account(
    acc_id INT,
    acc_name VARCHAR(50),
    balance decimal(10,2)
);

insert into bank_account values
(1,"alice",5000.00),
(2,"bob",3000.00);

select * from bank_account;
set sql_safe_updates=0;
start transaction;
update bank_account set balance=balance-1000 where acc_id=1;
rollback;

update bank_account set balance=balance+1000 where acc_id=2;
rollback;
