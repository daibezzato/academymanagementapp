#########################################
#USER#
########################################
#call create_user('juancito', 'unacontrasenia','play');
#call create_user('holisholis', 'unamejorpass','play');
#call create_user_information(18,'ajore', 'bububu','35468974','1998-5-12', 'unemailrelindo@gmail.com');
#SELECT * FROM isftdb.user;
#SELECT * FROM isftdb.user_information;
#call delete_user(6)
#call get_user_information(16)
#########################################
#CAREER#
########################################
#call create_career('analista de sistemas', 'aca analizamos los mejores sistemas', 'asdf-1548');
#call create_career('emergencias', 'curar sabiendo', 'asdf-3434');
#call create_career('terapeutico', 'acompaniamos con carinio ', 'asdf-3333');
#SELECT * FROM isftdb.career;
#SELECT idCareer FROM isftdb.career where careerName = 'analista de sistemas'
#call update_career(5,'emergencias en salud', 'curar sabiendo', 'asdf-3434', 0);
#SELECT * FROM isftdb.career;
#call get_all_careers()
#call get_career(5)
#call get_career(8)
#########################################
#GROUP#
########################################
#call create_group('alumnos', 'estudiantes del instituto');
#call create_group('profesores', 'docentes del instituto');
#Select * from isftdb.group;
#call delete_group(1)
#call restore_group(1)
#########################################
#SUBJECT#
########################################
#call create_subject('matematica', 5)
#########################################
#ATTENDANCE#
########################################

