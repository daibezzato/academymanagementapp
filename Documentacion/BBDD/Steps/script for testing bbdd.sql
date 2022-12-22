#########################################
#USER#
########################################
#call create_user('pedrito', 'unacontrasenia','play');
#call create_user('juancito', 'unacontrasenia','play');

#call create_user('holisholis', 'unamejorpass','play');
#call create_user_information(18,'ajore', 'bububu','35468974','1998-5-12', 'unemailrelindo@gmail.com');
#call create_user('pedritotrx', 'altapasspedrito','tree');
#call get_all_users();
#call create_user_information(20,'dsfgaf', 'fasdf','454566825','1998-8-25', '12dssafds@gmail.com');
#call get_all_users();
#call get_all_users_information();
#call delete_user(6)
#call get_user_information(16)
#########################################
#CAREER#
########################################
#call create_career('analista de sistemas', 'aca analizamos los mejores sistemas', 'asdf-1548');
#call create_career('emergencias', 'curar sabiendo', 'asdf-3434');
#call create_career('terapeutico', 'acompaniamos con carinio ', 'asdf-3333');
#SELECT idCareer FROM isftdb.career where careerName = 'analista de sistemas'
#call update_career(5,'emergencias en salud', 'curar sabiendo', 'asdf-3434', 0);
#SELECT * FROM isftdb.career;
#call get_all_careers()
#call get_career(6)
#call get_career(8)
#########################################
#GROUP#
########################################
#call create_group('alumnos', 'estudiantes del instituto');
#call create_group('profesores', 'docentes del instituto');
#call create_group('directivos', 'directivos del instituto');
#call create_group('preceptores', 'preceptores del instituto');
#call delete_group(1)
#call get_all_groups()
#########################################
#SUBJECT#
########################################
#call create_subject('fisica', 5);
#call create_subject('quimica', 5);
#call create_subject('algebra', 5);
#call create_subject('biologia', 5);
#call create_subject('enfermeria', 5);
#call create_subject('curitas', 5);
#call create_subject('sanacion', 5);
#call create_subject('psicologia', 7);
#call create_subject('cuerpo', 7);
#call create_subject('recuperacion', 7);
#call create_subject('ayuda', 7);
#call get_all_subjects();
#call update_subject(2, 'matematica', 6, false);
#call update_subject(4, 'quimica', 6, false);
#call update_subject(3, 'fisica', 6, false);
#call update_subject(5, 'algebra', 6, false);
#call get_all_subjects();
#########################################
#ATTENDANCE#
########################################
#call create_attendance(10, 10, '1995-12-25', 'true')
#########################################
#ACTION#
########################################
#call create_action('cargar materias', 'usuario puede cargar materias')
#call get_all_actions()
#######################################
#call get_users_for_group(4)

