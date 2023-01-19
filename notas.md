
# Katalon Studio

Herramienta para automatizar pruebas "funcionales".

Tipos de pruebas?


# Tipos de Pruebas de software

- Caja negra / caja blanca


TAXONOMIA 1:

- Estáticas: Las que no requieren poner el código en marcha (no requieren ejecución)
    - Calidad de código < SONARQUBE ... Las pruebas que antes hacía un desarrollador SENIOR >>>> MANTENIMIENTO
        Fallos en la nomenclatura
        Fallos en las convenciones de uso
        Código repetido
    - Definición / Revisión de requisitos !
    - Revisión de un modelo de datos

- Dinámicas: Las que requieren poner el código en marcha (ejecutar)
    - Funcionales       Se centran en la funcionalidad / funcionamiento
    - No funcionales    Se centran en otros aspectos:
      - Rendimiento
      - Estres
      - Carga
      - Usabilidad
      - ...

TAXONOMIA 2: Nivel de la prueba

- Unitarias             Revisar un componente de forma AISLADA... En ocasiones necesitamos de MOCKS
                        Mock??? Es un componente que intercepta comunicaciones con otros componentes y 
                                devuelve una respuesta preestablecida > Nos ayuda a aislar el componente.
                        Cuántas queremos? MONTONONES ! Al menos una prueba por componente!
                            Sonarqube nos da una pista guay: Complejidad ciclomática.
                                Complejidad ciclomática? Es el número de caminos que puede tomar un código.
                                Al menos tantas como la complejidad ciclomática del código.
                            COMPONENTE A √
                            COMPONENTE B √
- Integración           Revisan la COMUNICACION entre componentes
                            COMPONENTE A -> COMPONENTE B x -> La comunicación
- End2End (Sistema)     Revisan el COMPORTAMIENTO del sistema en su conjunto. Se comporta el sistema como debe.
- Aceptación            Las que me toca hacer si o si!

                                                    PODRIA 
                                                        OPCION 1: No hacer nada !
si condicion1 entonces:                                 
    tarea1                                              OPCION 2 = tarea1 + tarea2
    si condicion2 entonces:
        tarea2
    sino condicion2 entonces:                           OPCION 3 = tarea1 + tarea3
        tarea3
sino, si condicion3 entonces:
    tarea4                                              OPCION 4 = tarea4 + tarea5
    si condicion4 entonces:
        tarea5                                          OPCION 5 = tarea4 + tarea6
    sino condicion4 entonces:
        tarea6
                                                    COMPLEJIDAD CICLOMATICA DE 5 >>>> Cuántas pruebas al menos debo hacer !

# Pruebas de regresión: 

Cualquier prueba que vuelvo a hacer al tiempo para asegurarme que sigue OK !

Hoy en día "TODAS" las pruebas se convierten en pruebas de regresión !

Por qué? (Lo de arriba no siempre ha sido así... hace 20 años no ocurría)
- Metodologías de desarrollo de software.
  - Hace 20 años se usaban: CASCADA WATERFALL
    Me meto a hacer TODO el desarrollo (8 meses... 2 años)... Y al acabar hago las pruebas ! 1 única vez... o 2(5) si falla la primera.
  - Hoy en día usamos: AGILES (Scrum, Xtreme programming)
    Voy dando a mi cliente el producto de forma incremental! 
    En un plazo de entre 2 semanas y 2 meses le hago un entregable en producción ! > PRUEBAS POR UN TUBO !
                                                                                        Y de las gordas !!!!!!
    Entrega 1 (Sprint 1) Doy el 10% de la funcionalidad: Pantalla de login de la app.
        Que pruebo aquí (1)? El 10% de la funcionalidad

    Entrega 2 (Sprint 1) Doy un 5% adicional de la funcionalidad: Pantalla de login de la app + menu principal
        Que pruebo aquí (2)? El 5% de la funcionalidad nueva
                             + El 10% de la funcionalidad ya entregada (pruebas de regresión)
    En un proyecto voy a acabar entregando 40 veces.... MONTONONES DE VECES TENGO QUE EJECUTAR LAS PRUEBAS !
        Me suele traer cuentas AUTOMATIZARLAS !

# DEV -> OPS

Filosofía / Cultura / conjunto de prácticas en pro de la automatización.

                AUTOMATIZABLES?         HERRAMIENTAS                                                    QUIEN LAS USA
Plan                    x
Code                    x
Build                   √
        JAVA                            maven, gradle, sbt
        JS                              npm, yarn, webpack                                              desarrolladores
        C# .net                         dotnet, msbuild
Test
        Definición      x
        Ejecución       √
            Funcionales                 
                De un código pelao      Frameworks de pruebas unitarias: JUnit, UnitTest, MSTest        desarrollador

                De una interfaz web     Selenium \  Katalon Studio es una interfaz gráfica que usa SELENIUM
                De una app smatphone    Appium    |
                Basadas en el Comportamiento        Cucumber ^
                 BDD                                                                                    testers de automatización
                Rendimiento             JMeter, Loadrunner
                App de escritorio       UFT
                API Web (REST)          Postman, Karate
                API Web (SOAP)          SoapUI
        Donde las hago? 
            En la máquina del desarrollador? Ni de coña !!!!! Están bien maleadas esas máquinas !
            En la máquina del tester       ? Ni de coña !!!!! Están bien maleadas esas máquinas !
            En un entorno de pruebas precreado? Ni de coña! (antes lo haciamos así) Están bien maleadas esas máquinas !
            Hoy en día los entornos de pruebas, que siguen existiendo claramente y es donde hacemos las pruebas
            SON DE USAR Y TIRAR (esa es la tendencia)  ---> Palizón de trabajo.. 
                a no ser que este proceso (de creación y desmantelamiento de entornos) esté AUTOMATIZADO.

                Terraform                                                                               administradores de sistemas
                Vagrant
                Ansible
                Puppet
                Chef
                Salt
                Docker
                Kubernetes
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< INTEGRACION CONTINUA ! CI
Release
        Imágenes de contenedores (Docker)
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ENTREGA CONTINUA ! C Delivery 
Deployment
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DESPLIEGUE CONTINUO ! C Deployment
Operation
Monitor

Nos falta por automatizar la llamada ORQUESTADA a todas esas automatizaciones que hemos hecho.
Una automatización que podríamos llamar de SEGUNDO NIVEL: Servidores de AUTOMATIZACIÓN: Servidores de CI/CD

* Jenkins
- Bamboo
- Azure Devops
- Travis CI
- Gitlab CI/CD
- Github actions

La configuración de estas herramientas, que es una tarea que antes no hacíamos (hace 20 años), la hace el perfil DEVOPS !

# Son automatizables las pruebas?

Depende...  Definición de la prueba                 x
            Hacer un programa que realice la prueba x
            Ejecución de la prueba (ese programa)   √

# Qué significa AUTOMATIZAR una prueba? 

Hacer un programa (script secuencia de tareas) que haga la prueba por nosotros.   >>>     Testers > Programadores

# Por qué queremos automatizar las pruebas ? 

Para no hacerlas manualmente. Ahorrar tiempo...y pasta ... realmente ahorramos tiempo frente a ejecutarlas manualmente? 
Depende. De qué? Del número de veces que vaya a necesitar esa prueba!

> Si el tiempo de desarrollo < Tiempo empleado en ejecutar manualmente la prueba TODAS LAS VECES QUE SEA NECESARIO 

Conseguimos una mejora en la calidad del producto, al poder ejecutar "de gratis" las pruebas 
tantas veces como quiera (que suele ser todos los días)

A día de hoy, dentro de los flujos de CI, que los puedo ejecutar cada noche, 
me permito el ejecutar cada noche TODAS LAS PRUEBAS.

# Para qué sirven las pruebas?

x Para verificar que la app es estable y no tiene errores
- Para verificar que un software cumple con unos requerimientos
- Para identificar la mayor cantidad posible de defectos.
- Para si algo no funciona, IDENTIFICAR RAPIDAMENTE QUE ES LO QUE NO FUNCIONA ! Facilitar el debugging

# MUNDO DEL TESTING: ISTQB

Falacia de La ausencia de errores : Es imposible garantizar esto.

# En el mundo del testing hablamos de:

- Errores:      Comportamiento cometido por un ser humano
- Defectos:     Damos lugar a defectos en el código
- Fallos:       Algunos de los defectos pueden dar la cara (manifestarse) en forma de error


# Entornos de trabajo

- Entorno de desarrollo
- Entorno de pruebas / Q&A / testing / pre-producción / Entorno de INTEGRACIÓN !
- Entorno de producción

---

# Pruebas funcionales sobre una interfaz gráfica WEB

## Por qué automatizar las pruebas de interfaz WEB?

Por todo lo anterior...
Y:
- La misma prueba la quiero hacer en varios navegadores.
    Cada vez tengo más garantizado que lo que funciona en un navegador va 
    a funcionar en el resto (o en los más importantes al menos):
    - Casi todos los navegadores se basan en el mismo código CHROMIUM
    - Estándares más rígidos y mejor definidos en el mundo WEB (HTML, CSS, Javascript ES7, EC2019, EC2022)
    - Casi todas las web las acabamos montando con los mismos frameworks, que están bastante probados:
      - ReactJS
      - AngularJS
      - VueJS
      - Bootstrap

    App para una empresa privada interna: Está muy limitado la cantidad de navegadores desde donde la app se ejecuta.
    App web para un ministerio, banco, wallapop, amazon
- Los navegadores , en todas sus versiones se comportan de la misma forma? 
    A lo mejor me interesa hacer la prueba en las últimas n(5) versiones del navegador
- En todos los Sistemas operativos: Android (Kernel linux), Windows, iOS, MacOS, GNU/Linux (Ubuntu, Debian, Fedora)
  - En la última versión de esos SO?
- En distintos dispositivos? tablets, telefonos -> Resoluciones muy especificas y diferentes a las computadoras 

5 x 5 x 5 x 3 x 3 = 125 x 9 ... + de 1000 pruebas XD !!!!!!

Al final esto NO SE HACIA ! Hoy en día si gracias a la AUTOMATIZACION ... y en concreto gracias a SELENIUM !

# Selenium ?

Selenium NO PERMITE HACER PRUEBAS !

Selenium AUTOMATIZA operaciones sobre un navegador de internet!

Tiene 3 herramientas:
- Selenium IDE = RUINA GRANDE !!! NO SE USA PA' NA'
- Selenium Webdriver = GUAY !!!!!!
- Selenium GRID = También es guay, pero para otra cosa.

# Selenium IDE: 

Permite grabar/escribir operaciones que hacemos en un navegador web y ejecutarlas en automático a posteriori.
NO SE USA PARA NADA !

# Selenium Webdriver

Framework para controlar desde programa escritos en :
- Java
- Python
- JS
- C#
- ...
Navegadores de internet, como:
- Edge
- Chrome
- Firefox
- Opera
- ...


Programa Python > Librería Selenium Webdriver   Python  > driver de control de un navegador > navegador
         JAVA                                   JAVA            chrome (para cada versión)      chrome
         C#                                     C#              opera                           opera
         ...                                    ....            edge                            edge

Programa que vamos a montar: SCRIPT
 Paso 1 : Abrir conexión con el driver para controlar un navegador
 Paso 2 : Realizar operaciones en el navegador
                Vete a la página https://miapp.miempresa.com    (1)
                En el formulario de login mete:                 
                    Usuario: fererico                           (2) **
                    Contraseña: Federi02022$
                Pulsa en el menú en el enlace: Buscar
                En el formulario rellena en un campo el valor "MANZANAS"
                Mira el resultado.
                Si salen manzanas, es que la web está funcionando!!!  ***** ESTA OPERACION NO ES DE SELENIUM: LA PRUEBA !
                        Se escribe con un framework de pruebas unitarias. ESTO NO ES SELENIUM 
                    Y saca FOTO !!! 
 Paso 3 : Cerrar conexión con el navegador

El tema es: quién escribe este script?
- Lo puedo escribir yo, si se de (python | java | c# y demás de selenium)
- O lo puede escribir en """automático""" herramientas como KATALON STUDIO o KATALON RECORDER (similar a selenium IDE = kk)
                                                                                Hace poco... PERO LO QUE HACE ES GUAY !!!
KATALON STUDIO lleva dentro una herramienta parecida a SELENIUM IDE, que me permite 
generar """" automaticamente """" estos scripts

Por cierto.... estamos generando un script: PROGRAMA ... Donde lo voy a guardar? En una carpeta en mi disco duro? 
NI DE COÑA !!!!
En un repositorio de un sistema de control de código fuente tipo GIT !!!!


# Y cómo escribo esas instrucciones??? ESTO ES CRITICO 

Lo primero necesito un lenguaje de programación... 
Si uso algo como Katalon, Katalon va a ser quién use el lenguaje de programación y escriba el código.

En resumen, Katalon traduce mis palabras (actos) en código python, JAVA, ... 

PERO DESGRACIADAMENTE NO BASTA CON ESO !
2** Cómo sabe Katalon cuál es la casilla donde debe poner "federico"? 

Identificando el elemento HTML sobre el que quiero hacer una operación determinada !

Y cómo lo identifico? 
- Por sus atributos = RUINA GRANDE !
- Por sus estilos   = IGUAL DE RUINA !
- Por su posición   = RUINOTE !!!!
- Por un identificador que tenga asociado = SUPERGUAY, INMEJORABLE (si es que lo tiene)

Esto nos obliga a tener cierto entendimiento de HTML

# HTML

Lenguaje de marcado de hipertextos, basado en etiquetas. 
Lo define un estándar publicado por la organización: W3C World Wide Web Consortium (Tim Berners Lee)

<html>
    <head>
        <!-- Titulo -->
        <!-- Referenciar las hojas de estilo utilizadas : CSS -->
        <!-- Referenciar los JAVASCRIPT utilizadas : JS -->
    </head>
    <body>
        <!--Contenido que queremos visualizar en la web-->
        <p>Un parrafo</p>
        <img src="ruta"/>
        <ol>
            <li id="item1">Item 1</li>
            <li>Item 2</li>
            <li>Item 3</li>
        </ol>
        <button id="boton_login">
        <table>
        <a>
        <!-- La información acerca de COMO representar estos elementos se detalla en los ficheros: CSS -->
    </body>
</html>

Si los desarrolladores lo han tenido a bien (si son buena gente... y usualmente NO LO SON... quieren putearnos!)
habrán identificado cada elemento mediante un atributo "id".
El estándar HTML obliga a que ciertos elementos lleven un ID... pero solo algunos.
Y cuando el estándar no obliga que hacen los desarrolladores, tiriri !!!!

SI QUEREMOS USAR SELENIUM, DEBEMOS LLEGAR A UN ACUERDO CON EL EQUIPO DE DESARROLLO, 
y tratar de que TODO elemento con el que se pueda interactuar lleve un ID.


Cuando no tengo un ID, lo que tengo es un PROBLEMON ! GORDO !

Si dejo a Katalon intentar buscar una forma creativa de identificar un elemento 
con el que estoy interactuando, la va a encontrar!

Esa forma que Katalon calcula para identificar el elemento en el 90% de los casos NO VALE !
Si dejo eso, a los 3 días ( si me apurais en 2) deja de funcionar el script !


Echad un ojo a W3School > XPATH


# SELENIUM GRID

Nos permite montar un enjambre de dispositivos de distinta naturaleza con navegadores diferentes, en diferentes versiones.
Así como su acceso remoto.

Usualmente usamos (mediante pago por uso) un enjambre creado por otros.

Un gracia con selenium grid....

# Contenedor

La contenedorización es la forma estandar a dia de doy de distribuir e instalar software.
Todos los entornos de producción o corren en contenedores o están en su proceso -> Kubernetes!

Contenedor: Es un entorno aislado dentro de un SO con kernel Linux donde ejecutar procesos.
Aislado? 
- El contenedor (ese entorno) tiene su propia IP
- Tiene su propio sistema de archivos
- Tiene sus propias variables de entorno
- Puede tener limitaciones de acceso al Hardware de la máquina.

Docker (Docker desktop para windows / mac)

Los contenedores se crean desde imágenes de contenedor.

# Imagen de Contenedor

Un triste fichero comprimido (tar) que contiene un programa YA INSTALADO por alguien, y PREconfigurado.
Listo para su ejecución.

Esas imágenes de contenedor las encontramos en REGISTRIES DE REPOS DE IMAGENES DE CONTENEDOR.
El más famoso: Docker hub


# Framework de pruebas

JUnit, TestNG, MSTest, UnitTest....

En ellos, una prueba puede acabar en 3 estados:
- Success(Exito)                     Si todo va como era de esperar
- Failure(Fallo)                     Si las cosas no han salido como se esperaba
- Error(Explosión gigante !)         Si las cosas no han salido !

# Al crear un script de Selenium para pruebas en un navegador web

Tipos de tareas que podemos meter en esos scripts:
- Acciones: 
  - Ratón: Clic, Doble-clic, Mouse over, Mouse down, Mouse up
  - Teclado: Escribir
- Acciones que no interactuan directamente con un elemento del navegador:
  - Esperar un determinado tiempo 
  - Esperar a un elemento
- Acciones de prueba:
  - Verify / Assert     Estas tareas son las que hacen una prueba concreta
                        e internamente se montan usando un framework de pruebas unitarias.
Tanto tareas de tipo ACCION como PRUEBAS (y algunas de tipo WAIT) operan sobre componentes
de la página web que se esté mostrando.

Es necesario tener una forma de IDENTIFICAR ESOS COMPONENTES.
- La mejor es disponer de un ID (Los IDs deben ser únicos en un documento/página)
- En caso que no haya ID, la cosa se complica. Alternativas:
  - En general, la mejor siempre es usar XPATH
  - Se pueden usar también los selectores de estilos CSS
  - Hay un atributo HTML que puede dar un buen resultado: NAME
        El atributo NAME se usa también como identificador, pero:
            - NO ES UNICO A NIVEL DEL DOCUMENTO, SOLO A NIVEL DEL FORMULARIO QUE LO CONTIENE


<a id="" href="">
<form>
    <input name="" id="NOMBRE" >
</form>

Los inputs pueden ser:
- Cajas de texto
- Options / Listas desplegables
- Checkboxes
- Radio buttons
Cada input lleva un atributo NAME. Es obligatorio.
Y ese atributo NAME debe ser único dentro de ESE FORMULARIO.

# XPATH

XPATH es un estandar del W3C.

Nos permite identificar objetos (elementos) dentro de un árbol de elementos.

HTML                                                1
    HEAD                                            2
    BODY                                            3
        DIV                                         4
            P                                       5
                STRONG                              6
                    A                               7
        DIV                                         8
            DIV                                     9
                A                                  10
                H1: Ayuda a domicilio              14
            DIV id=parrafoA                        11
                P                                  12


La barra del (7) / permite:
- Si la escribo al principio d la expresión XPATH, me identifica la raiz del arbol (HTML)
- Si al principio de una expresión incluyo 2 barras del 7 //, me identifica "cualquier padre"
- Si la escribo en medio de la expresión, me identifica un hijo
- La doble barra la puedo usar también dentro de una expresión

EXPRESIONES XPATH
/html                                               1           Se uso bastante poco !
//div                                               4, 8, 9     Más utilizado
    Busca un div que tenga cualquier padre
//div/div                                           9
    Busca un div que tenga como padre un div que tenga cualquier padre
//div/a                                             10
//div//a                                            7, 10

PREDICADOS. Se escriben entre corchetes y ayudan a filtrar más un elemento que me interese
//div/p                                            5, 12
//div[@id='parrafoA']/p                            12
//div[1]/p                                         5
    Selecciona aquellos DIV que sean los primeros hijos de su padre
//div[last()]/p                                    12
//div[./div/p]                                      8
//div/div/p                                        12
//div[contains(h1/text(),"Ayuda")]                 9
//div/h1[contains(text(),"Ayuda")]                 14
//body/form[1]/div[1]/input
//form[*/text()='Login']//input[@name='usuario']
//*[@id='VALOR']

En los predicados puedes combinar criterios con las palabras "and" "or"
Operadores a usar en los predicados: = != > >= < <= + - * div

<body>
    <h1>Acceso</h1>
    <form>
        <div class="titulito">Login</div>
        <div>
            <span>Usuario</span> <input name="usuario"></input>   ******
        </div>
        <div>
            <span>Contraseña</span> <input name="password"></input>
        </div>
    </form>
    <form>
        <h2>Registrese</h2>
        <div>
            <span>Usuario</span> <input name="usuario"></input>
        </div>
        <div>
            <span>Contraseña</span> <input name="password"></input>
        </div>
    </form>
</body>

//*[@id="rso"]/div[1]/div/div/div/table/tbody/tr[1]/td/div/h3/a
/html/body/div[8]/div/div[11]/div[1]/div[2]/div[2]/div/div/div[1]/div/div/div/table/tbody/tr[1]/td/div/h3/a


Paso 1: Abre        google.es
Paso 2: Click       En el caja name=q
Paso 3: Escribe     En el caja name=q           abc
Paso 4: Aprieta     En la caja name=q           ENTER
--> En automático dispara la búsqueda en google... y en un poquito de tiempo carga la nueva pantalla de resultado
Paso 5: Click el resultado que contenga un enlace con la ruta "abc.es"
        //*[@id='rso']//a[contains(@href,'abc.es')] Lo he creado yo con ayuda de ChroPath
        
        <div id="rso"> <!--Contiene los resultados de la búsqueda de google-->
        ....
            <a href="https://www.abc.es">
        </div>
--> En automático el navegador abre esa ruta ! https://www.abc.es 
Paso 6: Haz click en el enlace de "Ciencia"
    link=Ciencia
    xpath=//a[text()="Ciencia"]
    //div[contains(@class,"voc-nav")]//a[contains(text(),"Ciencia")]
Paso 7: Hacer click en la segunda noticia de la izquierda (que es la 3ª en el fichero)
//div[1][contains(@class,'voc-container')]//div[3][contains(@class,'voc-article-container')]//a



---

Vamos a montar un proyecto de pruebas.

Dentro de ese proyecto montamos un montón de scripts.

Queremos usar un sistema de control de código fuente (SCM) para controlar los ficheros de nuestro proyecto de pruebas.

# SCM

Sistema de control de código fuente = Sistemas de control de versión (CVS)

Hoy en día han quedado 2 sistemas de control de código fuente de uso mayoritario:
- git ****
- mercurial

Linus Torvalds = Linux

Git es un SCM muy peculiar.

# Qué nos permiten estos sistemas ?

- Llevar un control de todos los cambios que se van realizando en el proyecto. En cualquier momento pueda :
  - Ir a una versión anterior                   \
  - Saber quién hizo un determinado cambio      / Un sistema de copias de seguridad
  - Controlar versiones paralelas del proyecto ******** RAMAS 
- Sincronizar los cambios de todos los miembros del equipo de trabajo.
- Medio para hacer copias de seguridad y tener mi código en otro computador a salvo (servidor remoto)

En un SCM guardamos lo que llamamos COMMITs. En git también. 

Qué es un commit? Una fotografía cerrada y sellada de un proyecto.
UNA COPIA DE SEGURIDAD COMPLETA DE TODOS LOS ARCHIVOS.
Asociado a un commit se guardan ciertos metadatos:
- Quién lo hizo?
- Cuándo lo hizo?
- Por qué lo hizo?

                                                Lucas           Mateo
                                                 v
Ficheros                            Dia 1   ->  Commit1 >       Commit1
                                                    v               v
Modificaciones + nuevos ficheros    Dia 2   ->  Commit2         Commit4
                                                    v               v
Modificaciones + nuevos ficheros    Dia 3   ->  Commit3         Commit5
                                                    v  <-----------|        Merge (Fusión de cambios)
                                                Commit6

RAMAS: 
    main (master) En ella no se trabaja. NUNCA SE HACE UN COMMIT. Lo que hay en esta rama está listo para PROD
        \
        dev (desarrollo, development)
          \ Abrir ramas por funcionalidades (test rendimiento)(test-ui)
          \ Abrir ramas por persona (lucas) (mateo)

Esos commits se almacenan en lo que denominamos un REPOSITORIO!
Yo tengo mi carpeta en mi máquina, donde tengo mis archivos.... pero en mi máquina también tengo un repositorio
Es una carpeta que va guardando todas las fotos que hago del proyecto y las realizadas por otros compañeros.


            Servidor de repositorios REMOTOS: repositorio para este proyecto: C1 > C2 > C4
                            |
        -------------------------------------------
        |                                         |
    LucasPC                                     MateoPC
    carpeta del proyecto                        carpeta del proyecto
    repositorio                                 repositorio
     C1 > C3 > C4                                 C1 > C2 > C4
        > C2                                           C3

    C1 Va del ordenador de Lucas al servidor remoto: PUSH
    C1 Puede ir del servidor remoto al MateoPC:      FETCH
    Lucas debe fusionar los cambios que Mateo ha hecho con los suyos propios: MERGE C3+C2

    Habitualmente Lucas, haría una operación denominada PULL = FETCH + MERGE

No todos los ficheros que tengo en mi carpeta del proyecto quiero que se suban al repo de git ni que se guarden en las fotos.
Por ejemplo, el resultado de un test, un log de ejecución, un archivo de notas mio

Estos ficheros /carpetas que no queremos que suban al SCM los damos de alta en un fichero llamado .gitignore

Los repositorios remotos se alojan en servicios de almacenamiento de repositorios remotos:
- GITHUB - Microsoft
- GITLAB
- BITBUCKET < Atlassian (JIRA, Confluence)

En un momento dado, nosotros vamos a querer (hoy en día SIEMPRE !) que haya una tercera personita 
ejecutando todas las pruebas de mi proyecto de pruebas: JENKINS !

Jenkins, Travis, AzureDevops... lo que hará será descargar el proyecto del SCM (git)

# build.gradle

Existen programas que ayudan con:                           MAVEN !
- El empaquetado y compilación de un proyecto de software
- Gestión de dependencias
- Ejecución del software

GRADLE es una alternativa a MAVEN. En este caso, la que eligen los desarrolladores de Katalon Studio.

Cuando montamos un proyecto con Katalon Studio, en automático se nos configura un fichero de gradle
(build.gradle) para que podamos ejecutar/compilar y empaquetar todo nuestro proyecto de pruebas.

--

1- Definir las pruebas
2- Automatizar las pruebas
3- Ejecutar las pruebas

Cómo definimos las pruebas?
Y si no tengo Katalon Studio... donde.

Gherkin es un lenguaje que usamos con un triple propósito!
- Definir requisitos mediante escenarios de uso
    v^ Estos dos son la misma cosa
- Definir casos de prueba
- Generar el esqueleto de ficheros de pruebas automatizadas AUTOMATICAMENTE !

Existe una herramienta de software llamada CUCUMBER

----
#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
---
Estoy especificando un requisito a través de un Comportamiento ---> BDD : Behavior driven development

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
      | usuario  | password  |
      | ruina    | grande    |
      | grande   | ruina     |

  Scenario Outline: El sistema permite acceder con datos correctos
    When Relleno en el campo "usuario" el valor <usuario>
     And Relleno en el campo "password" el valor <password>
     And Pulso el botón de "login"
    Then Llego a la página "https://katalon-demo-cura.herokuapp.com/#appointment"

    Examples: 
      | usuario     | password          |
      | John Doe    | ThsIsNotAPassword |

---

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


---
Escribir un programa en groovy

                                      id_campo       valor
function  "Relleno en el campo con id (.*) el valor (.*)"{

    // Escribir código groovy para que 
    Se seleccione el objeto del navegador con id = id_campo

    Se le mande como value = valor

}

                                      objeto       valor
function  "Relleno en el campo con id (.*) el valor (.*)"{

    // Escribir código groovy para que 
    Se seleccione el objeto del navegador en base al XPATH wue yo tenga declarado en el objeto de Katalon Studio

    Se le mande como value = valor

}

