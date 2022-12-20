#########################################
#USER#
########################################
#call create_user('pepeelmasgrande', 'shouldcreate_userbestringwithsalthashed', 'jose', 'perez', '365895478', '2011-4-11', 'pepitoelmasfroso@gmail.com', 'farm');
#call create_user('elagusturrito', 'unamejorpass', 'Agus', 'Sala', '365894478', '2011-4-23', 'elagusturrito@gmail.com', 'xbox');
#SELECT * FROM isftdb.user;
#SELECT * FROM isftdb.user_information;
#DELETE FROM isftdb.user Where idUser = 12;
#call delete_user(6)
#call restore_user(6)
#########################################
#CAREER#
########################################
#call create_career('analista de sistemas', 'aca analizamos los mejores sistemas', 'asdf-1548');
#call create_career('emergencias', 'curar sabiendo', 'asdf-3434');
#call create_career('terapeutico', 'acompaniamos con carinio ', 'asdf-3333');
#SELECT * FROM isftdb.career;
#SELECT idCareer FROM isftdb.career where careerName = 'analista de sistemas'
#########################################
#GROUP#
########################################
#call create_group('alumnos', 'estudiantes del instituto');
#call create_group('profesores', 'docentes del instituto');
#Select * from isftdb.group;
#call delete_group(1)
#call restore_group(1)