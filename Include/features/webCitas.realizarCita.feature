Feature: Solicitar cita
  Queremos probar las funcionalidades de la pantalla de solicitud de citas.
  ...

  Background:
    Given Que estoy en un navegador
      And accedo a la página "https://katalon-demo-cura.herokuapp.com/profile.php#login"
      And Relleno en el campo con id "usuario" el valor "John Doe"
      And Relleno en el campo con id "password" el valor "ThisIsNotAPassword"
      And Pulso el botón con id "login"

  Scenario Outline: Puedo hacer una cita correctamente
    Given accedo a la página "https://katalon-demo-cura.herokuapp.com/#appointment"
    When Relleno en el campo con id "facility" el valor <falicity>
     And Relleno en el campo con id "readmission" el valor <readmission>
     And Relleno en el campo con id "program" el valor <program>
     And Relleno en el campo con id "visitdate" el valor <visitdate>
     And Relleno en el campo con id "comment" el valor <comment>
     And Pulso el botón de "book-appointment"
    Then Llego a la página "https://katalon-demo-cura.herokuapp.com/appointment.php#summary"
     And Se muestra el mensaje "Appointment Confirmation"
     And Se muestra como con id "facility" el valor <falicity>
     And Se muestra como con id "readmission" el valor <readmission>
     And Se muestra como con id "program" el valor <program>
     And Se muestra como con id "visitdate" el valor <visitdate>
     And Se muestra como con id "comment" el valor <comment>

    Examples: 
      | facility                           | readmission | program  | visitdate  | comments |
      | Hongkong CURA Healthcare Center    | true        | Medicaid | 12/12/2023 |          |
      | Tokio CURA Healthcare Center       | false       | Medicare | 12/01/2023 | Hola     |
      | Seoul CURA Healthcare Center       | true        | None     | 12/12/2025 | Eureka   |
