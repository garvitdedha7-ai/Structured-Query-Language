# REGEXP OPERATORS

select * from studio
   where name  regexp "ra" ;
   
   select * from studio
   where name  regexp "ta";
   
   select * from studio
   where name  regexp "^ra";
   
   select * from studio
   where name  regexp "^sA";
   
     select * from studio
   where name  regexp "an$";
   
     select * from studio
   where name  regexp "ram|kapoor|khan";
   
    select * from studio
   where name  regexp "^ram|poor|^khan";
   
     select * from studio
   where name  regexp "[rm]" ;
   
      select * from studio
   where name  regexp "[rm]a";
   
      select * from studio
   where name  regexp "[rm]a";
   

select *from studio
   where name  regexp "[rhma]a";
   
   select *from studio
   where name  regexp "^[rs]";
   
   select *from studio
   where name  regexp "r[am]";
