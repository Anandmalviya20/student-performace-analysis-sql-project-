create database student_project;
use student_project;
select * from stu_perform;
select count(distinct(student_ID)) as total_student from stu_perform;

-- 1)What is the average exam score for students grouped by their preferred learning style?
select Preferred_Learning_Style,avg(Exam_Score_percent) as average_score from stu_perform 
group by Preferred_Learning_Style ;

-- 2️⃣ Is there a correlation between study hours per week and final grades?
select  avg(Study_Hours_per_Week),final_grade from stu_perform
group by final_grade;

-- 3️⃣ Do students with higher attendance rates tend to score better in exams?
select 
     case 
          when attendance_rate_percent <=60 then "lower attendence"
          when attendance_rate_percent between 60 and 80  then "mid attendence"
          else "higher attendance"
	 end as attendence_level,
     round(avg(Exam_Score_percent)) average_score from stu_perform
group by attendance_rate_percent
order by attendance_rate_percent desc;

-- 4️⃣ How does time spent on social media impact exam scores?
select 
      case  
		  when Time_Spent_on_Social_Media_hours <= 10 then "low usage"
          when Time_Spent_on_Social_Media_hours between 10 and 20 then "moderate usage"
          else "high usage"
       end as social_media_spent   
	   ,avg(Exam_Score_percent) average_score 
from stu_perform
group by social_media_spent
order  by average_score desc ;


-- 5️⃣ Do students with higher stress levels have lower exam scores?
select Self_Reported_Stress_Level,avg(Exam_Score_percent) from stu_perform
group by Self_Reported_Stress_Level;

-- 6️⃣ Do students who complete more online courses perform better in exams?
select 
      case 
	      when Online_Courses_Completed <= 5 then "low"
          when Online_Courses_Completed between 5 and 15  then "medium"
          else "high"
	  end as completion_level
      ,avg(Exam_Score_percent) AS average_score from stu_perform
group by  completion_level
;

-- 7️⃣ Is there a difference in academic performance between male and female students?

select gender,avg(Exam_Score_percent) from stu_perform
group by gender;

-- 8️⃣ How does the number of sleep hours per night affect final grades?
select Sleep_Hours_per_Night ,avg(Exam_Score_percent) as average_score from stu_perform
group by Sleep_Hours_per_Night
order by avg(Exam_Score_percent) desc;

-- 9️⃣ Do students who actively participate in discussions and complete assignments perform better?
select Participation_in_Discussions,avg(Assignment_Completion_Rate_percent),avg(Exam_Score_percent) from stu_perform
group by Participation_in_Discussions;


-- 10 ) What is the distribution of final grades among students?
select Final_Grade,count(*),count(*)*100 /10000 as percentage from stu_perform
group by Final_Grade
order by count(*) desc;
