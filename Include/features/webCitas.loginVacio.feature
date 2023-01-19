Feature: Formulario de login
  Queremos probar las funcionalidades de la pantalla de login.
  El sistema debe contar con una pantalla de login que impida accesos no autorizados al sistema.

  Background:
    Given Que estoy en un navegador
      And accedo a la página "https://katalon-demo-cura.herokuapp.com/profile.php#login"

  Scenario: El sistema debe obligar a rellenar un usuario y Contraseña
    When Pulso el botón de "login"
    Then Se muestra el mensaje "Login failed"

  Scenario Outline: El sistema no permite acceder con datos erroneos
    When Relleno en el campo "usuario" el valor <usuario>
     And Relleno en el campo "password" el valor <password>
     And Pulso el botón de "login"
    Then Llego a la página "https://katalon-demo-cura.herokuapp.com/profile.php#login"
     And Se muestra el mensaje "Login failed"

    Examples: 
      | usuario  | password               |
      | ruina    | grande                 |
      | John Doe | ruina                  |
      | ruina    | ThisIsNotAPassword     |

  Scenario Outline: El sistema permite acceder con datos correctos
    When Relleno en el campo "usuario" el valor <usuario>
     And Relleno en el campo "password" el valor <password>
     And Pulso el botón de "login"
    Then Llego a la página "https://katalon-demo-cura.herokuapp.com/#appointment"

    Examples: 
      | usuario     | password          |
      | John Doe    | ThsIsNotAPassword |

      