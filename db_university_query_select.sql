1) Selezionare tutti gli studenti nati nel 1990 :
    SELECT `name`, `surname`, YEAR(`date_of_birth`) AS 'year_of_birth'
    FROM `students`
    WHERE YEAR(`date_of_birth`) = 1990;

2) Selezionare tutti i corsi che valgono più di 10 crediti :
    SELECT `name`, `description`, `period`, `year`, `cfu`
    FROM `courses`
    WHERE `cfu` > 10;

3) Selezionare tutti gli studenti che hanno più di 30 anni : 
    SELECT `name`, `surname`, TRUNCATE(DATEDIFF(CURDATE(), `date_of_birth`)/365, 0) AS 'age'
    FROM `students`
    WHERE TRUNCATE(DATEDIFF(CURDATE(), `date_of_birth`)/365, 0) > 30;

4) Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea :
    SELECT * 
    FROM `courses` 
    WHERE `period` = 'I semestre' AND `year` = 1;

5) Selezionare tutti gli appelli 'd'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 :
    SELECT * 
    FROM `exams` 
    WHERE `hour` > '14:00:00' AND `date` = '2020/06/20';

    or more pretty:

    SELECT DATE_FORMAT(`date`, "%d %M %Y"), `hour`, `location`, `address`
    FROM exams
    WHERE DATE_FORMAT(`date`, "%d %m %Y") = DATE_FORMAT('2020-06-20', "%d %m %Y") AND `hour` > '14:00:00';

6) Selezionare tutti i corsi di laurea magistrale :
    SELECT `name`,`level`,`address`,`website` 
    FROM `degrees`
    WHERE `level` = 'magistrale';

7) Da quanti dipartimenti è composta 'l'università ? :
    SELECT COUNT(`id`)
    FROM `departments`;

8) Quanti sono gli insegnanti che non hanno un numero di telefono? :
    SELECT * 
    FROM `teachers` 
    WHERE `phone`IS NOT NULL;