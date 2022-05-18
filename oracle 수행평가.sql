select 극장이름,위치

from 극장;

select 극장이름

from 극장

where 위치 like '잠실';

 

select 이름 

from 고객

where 주소 like '잠실'

order by 1;

 

select 극장번호, 상영관번호, 영화제목

from 상영관

where 가격=8000;

 

select 

from 고객,극장

where 극장.위치=고객.주소;

2

select count(극장번호)

from 극장;

 

select avg(가격)

from 상영관;

 

select count(날짜)

from 예약;

 

3

select 영화제목

from 상영관

where 상영관.극장번호 in(select 극장.극장번호

    from 극장

    left join 상영관

    on 극장.극장번호 = 상영관.극장번호

    where 극장.극장이름 like '대한');

 

select 고객.이름

from 고객,예약

where 고객.고객번호 = 예약.고객번호 and 예약.극장번호 in(select 극장.극장번호

                                                    from 극장,예약

                                                    where 극장.극장이름 like '대한' and 극장.극장번호=예약.극장번호) ;

select sum(가격)

from 상영관,극장

where 상영관.극장번호=극장.극장번호 and 극장.극장이름 like '대한'  ;

 

select 극장번호,count(상영관번호)

from 상영관

group by 극장번호;

 

select 상영관번호

from 상영관,극장

where 극장.위치 like '잠실' and 상영관.극장번호=극장.극장번호;

 

select 극장.극장번호, count(예약.고객번호) 

from 예약 

left join 극장

on 극장.극장번호 = 예약.극장번호 and 날짜 = '2020-09-01'

group by 극장.극장번호;

 

select 상영관.영화제목 

from 예약 

left join 상영관

on 상영관.극장번호 = 예약.극장번호 and 상영관.상영관번호 = 예약.상영관번호 and 날짜 = '2020-09-01'

group by 상영관.영화제목

having count(상영관.영화제목) = 1;

 

insert into 극장 values(9, '엔씨','잠실');

insert into 고객 values(7,'조수현','강남');

insert into 상영관 values(1,2,'하하하 영화',15000,48);

insert into 예약 values(1,2,7,15,'2020-09-01');

 

 

update 상영관 set 가격 = 가격 + 가격  (10100);

select  from 상영관;