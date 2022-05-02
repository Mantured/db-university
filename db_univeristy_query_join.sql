1) Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia:

    SELECT `students`.`name`, `students`.`surname`, `degrees`.`name` AS 'degree_course_name'
    FROM `students`
    JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
    WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

2) Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze :

    SELECT `degrees`.`name`, `degrees`.`address`, `departments`.`name`
    FROM `degrees`
    JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
    WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';


3) Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) :

    SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`,`courses`.`name` AS 'course_name', `course_teacher`.`teacher_id`
    FROM `course_teacher`
    JOIN `courses` ON  `courses`.`id` = `course_teacher`.`course_id`
    JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
    WHERE `teachers`.`name` = 'Fulvio' AND `teachers`.`surname` = 'Amato';


4) Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome :

    SELECT `students`.`registration_number`, `students`.`name`, `students`.`surname`, `degrees`.`name` AS 'degree_course_name', `degrees`.`address`, `departments`.`name` AS 'department_name', `departments`.`address`
    FROM `students`
    JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
    JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
    ORDER BY `students`.`name` ASC, `students`.`surname` ASC;

5) Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti :

    SELECT `degrees`.`name` AS 'degree_course_name', `degrees`.`level`, `degrees`.`address`, `courses`.`name` AS 'course_name', `courses`.`year`, `courses`.`cfu`, `teachers`.`name`, `teachers`.`surname`,
    CONCAT(`teachers`.`name`, " ", `teachers`.`surname`) AS 'professor'
    FROM `degrees`
    JOIN `courses` ON `courses`.`id` = `courses`.`degree_id`
    JOIN `course_teacher` ON `course_id` = `courses`.`id`
    JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`;


6) Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) :
    SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`, `departments`.`name` AS 'department_name'
    FROM `teachers`
    JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
    JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
    JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id`
    JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
    WHERE  `departments`.`name` = 'Dipartimento di Matematica';


7) BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami :

    /* before run this query 
    Remove ONLY_FULL_GROUP_BY from phpmyadmin
    Open phpmyadmin & select localhost
    Click on menu Variables & scroll down for sql mode
    Click on edit button to change the values & remove ONLY_FULL_GROUP_BY & click on save */

    SELECT CONCAT(`students`.`surname`, " ", `students`.`name`) AS `student`, `courses`.`name` AS `course_name`, 
    COUNT(`exam_student`.`vote`) AS `attempt`,
    MAX(`exam_student`.`vote`) AS `max_vote`
    FROM `students`
    JOIN `exam_student` ON `students`.`id` = `exam_student`.`student_id`
    JOIN `exams` ON `exams`.`id` = `exam_student`.`exam_id`
    JOIN `courses` ON `courses`.`id` = `exams`.`course_id`
    -- WHERE  `exam_student`.`vote` <= 18
    GROUP BY `exams`.`id`
    HAVING `voto_massimo` >= 18;