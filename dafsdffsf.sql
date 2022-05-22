select * from dept d ;
select * from emp e ;

select e.ename '사원이름', d.dname '사원직위'
from emp e, dept d 
where e.deptno = d.deptno;

select e.ename '사원이름', e.sal 
from emp e, dept d 
where e.deptno = d.deptno
and d.deptno = 30;


select ename , sal , ifnull(sal+comm, sal) '증가액',  (sal+(sal * 0.1)) '인상된 급여'
from emp
order by empno ;


select  ename , deptno 
from emp 
where ename like 's%'


select max(sal), min(sal), sum(sal), round(avg(sal))  
from emp;


select d.dname '업무', count(*) '업무별 사원수' 
from emp e, dept d 
where e.deptno = d.deptno
group by d.dname; 


select (max(sal) - min(sal)) '차액' 
from emp;


select count(*) '구성원 수', sum(sal) '합계', round(avg(sal)) '평균' 
from emp
where deptno = 30
order by deptno;


select deptno dno, round(avg(sal)) avgsal
from emp
group by deptno
order by avgsal desc 
limit 1;


select e.job '업무명', round(avg(sal)) 평균급여
from emp e 
where e.job != 'salesman'
group by e.job 
having sum(e.sal) >= 3000 
order by 평균급여 desc;


select count(*)
from emp 
where not mgr is null;


select ename '이름', sal '금액', comm '커미션', (sal + comm) 총액
from emp e 
where comm is not null
order by 총액 desc;


select deptno '부서번호', job '업무 이름', count(*) '인원 수'
from emp 
group by job


select d.dname 
from emp e right join dept d 
on e.deptno = d.deptno 
where e.empno is null;


select job '업무' , count(*) '인원 수'
from emp
group by job 
having count(*) >= 4;


select ename 
from emp
where empno between 7400 and 7600;


select e.ename '이름', d.dname 
from emp e, dept d 
where e.deptno = d.deptno ;




select e.ename '이름'
from emp e
where e.sal > (select sal 
from emp e 
where ename = 'scott');


-------2
use hr;

desc countries;
desc '데이터 베이스 이름';


select count(*)
from employees e;

select count(*)
from departments d ;

select employee_id , last_name , job_id , hire_date 
from employees e ;

select last_name , salary 
from employees e 
where salary >= 12000;


select last_name , department_id 
from employees 
where department_id in (20, 50)
order by last_name;


select last_name 
from employees
where substr(last_name, 3,1) = 'a' ;


select job_id ,count(*) 
from employees e 
group by job_id ;


select max(salary) - min(salary)
from employees e ;


select e.last_name , j.job_title , e.department_id , d.department_name 
from employees e , departments d ,locations l, jobs j 
where e.department_id = d.department_id 
and d.location_id = l.location_id 
and e.job_id = j.job_id 
and l.city = 'toronto';



 select e.last_name, e.job_id , jh.start_date 
 from employees e join job_history jh 
 on e.job_id = jh.job_id 
 where last_name = 'matos' or last_name ='taylor'
 order by jh.start_date asc;



select  last_name , hire_date 
from employees
where date_format(hire_date, '%y') = '1994'



select e.last_name , j.job_title , e.salary 
from employees e join jobs j 
on e.job_id = j.job_id 
where e.salary not in(2500,3500,7000)
and (j.job_title like 'sales representative'
or j.job_title like 'stock clerk');




select ifnull(manager_id, 'not manager') 'manager number' ,count(*) 'count'
from employees 
group by manager_id;


select e.manager_id, e.salary 
from employees e 
where e.salary = (
				select min(salary)
				from employees e
				where e.salary > 6000
				)
and e.manager_id is not null
order by e.salary desc;