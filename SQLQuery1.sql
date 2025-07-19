Select j.Job_ID,j.Designation,j.Salary,j.Location ,r.Experience,r.Qualification,r.Key_Skill from JD j INNER JOIN Requirement r
on j.Job_ID =r.Job_ID;

update Test set QID1='PQ1', Answer1='qwert4'where UserID='PPS3';
update Test set QID1='PQ2', Answer1='ABC' where UserID='PPS3';

update Applicant set APassword =@v1 where UserID=@v2 and AEmail=@v3;



   
