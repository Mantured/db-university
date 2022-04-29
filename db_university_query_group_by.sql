1) Contare quanti iscritti ci sono stati ogni anno :
    SELECT YEAR(`enrolment_date`) AS 'enrolment_year', COUNT(`id`) 
    FROM `students` 
    GROUP BY YEAR(`enrolment_date`);

2) Contare gli insegnanti che hanno 'l'ufficio nello stesso edificio :
    SELECT COUNT(id), `office_address`
    FROM `teachers` 
    GROUP BY `office_address`;

3) Calcolare la media dei voti di ogni appello 'd'esame :
    SELECT FLOOR(AVG(`vote`)) AS 'av_vote', exam_id
    FROM `exam_student`
    GROUP BY `exam_id`
    ORDER BY AVG(`vote`) ASC;


4) Contare quanti corsi di laurea ci sono per ogni dipartimento:
    SELECT COUNT(`id`), `department_id` 
    FROM `degrees` 
    GROUP BY `department_id`;
    