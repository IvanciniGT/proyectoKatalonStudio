#language: es
Característica: Formulario de login
  Queremos probar las funcionalidades de la pantalla de login.
  El sistema debe contar con una pantalla de login que impida accesos no autorizados al sistema.

  Escenario: El sistema debe obligar a rellenar un usuario y Contraseña
		Dado 			Que estoy en un navegador
	  	Y 			accedo a la página de login
	 	Cuando 		Pulso el botón de login
	 	Entonces 	Se muestra el mensaje Login failed
      Y				Saco una foto
	    Y 			Cierro el navegador

  Esquema del escenario: El sistema no debe permitir acceder con un usuario y contraseña erroneos
    Dado 			Que estoy en un navegador
      Y 			accedo a la página de login
    Cuando 		Escribo en el campo <campo_usuario> el valor <usuario>
      Y  			Escribo en el campo <campo_password> el valor <password>
    	Y 			Pulso el botón de login
    Entonces 	Se muestra el mensaje Login failed
      Y				Saco una foto
      Y 			Cierro el navegador
      
      Ejemplos:
      	|	campo_usuario | usuario  | campo_password | password             |
      	|	Usuario       | Ruina    | Password       | grande               |
      	|	Usuario       | John Doe | Password       | grande               |
      	|	Usuario       | Ruina    | Password       | ThisIsNotAPassword   |
      
  Esquema del escenario: El sistema debe permitir acceder con un usuario y contraseña correctos
    Dado 			Que estoy en un navegador
      Y 			accedo a la página de login
    Cuando 		Escribo en el campo <campo_usuario> el valor <usuario>
      Y  			Escribo en el campo <campo_password> el valor <password>
     	Y 			Pulso el botón de login
    Entonces 	Llego a la pantalla de citas
      Y				Saco una foto
      Y 			Cierro el navegador
      
      Ejemplos:
      	|	campo_usuario | usuario  | campo_password | password             |
      	|	Usuario       | John Doe | Password       | ThisIsNotAPassword   |
      
      