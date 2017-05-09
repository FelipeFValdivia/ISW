Bienvenido a Machin For Learning, MFL
===

#Información sobre el Stack utilizado

El sistema fue creado utilizando contenedores de docker para así mantener un mismo ambiente tanto en desarrollo (para ambos desarrolladores), como en producción. 
#Otra ventaja del uso de docker, es que la instalación y configuración de la base de datos (PostgreSQL) y RoR se hace automáticamente y se guarda en su propio contenedor. Sin necesidad de instalar Postgresql ni RoR en nuestra máquina. 

La elección de RoR es debido a que es un framework muy potente, con una comunidad muy activa con una gran cantidad de librerías(gemas) que permiten el desarrollo de aplicaciones web dejando de lado los problemas triviales centrando la concentración de los desarrolladores en los problemas del dominio del problema. Además, la estructura de ruby es muy limpia, permitiendo hacer software muy "limpio" que es sencillo de entender

La elección de PostgreSQL es debido a ser un motor de bases de datos muy potente que se comporta de muy buena manera con aplicaciones levantadas en RoR.

##Para correr el sistema
Para correr el sistema es necesario sólo instalar docker y docker-compose desde su página oficial. El archivo docker-compose.yml trae la configuración para correr en producción mientras que dctest.yaml trae la configuración para correr en desarrollo.

Para levantar el servicio por primera vez en ambiente de desarrollo, se debe correr el comando: docker-compose -f dctest.yaml up --build

-f indica el archivo con la configuración para levantar los servicios, dctest.yaml es el archivo con la configuración, up indica que se desea levantar el servicio y --build es para que se construya(necesario sólo la primera vez)

Para levantar el servicio nuevamente, luego de construir, solo se elimina --build, dando lo siguiente: docker-compose -f dctest.yaml up


### Sobre la utilización de Test Driven Development (TDD)
Un desarrollo realizado con TDD permite disminuir la cantidad de bugs en el sistema. Además es una metodología de desarrollo que permite entender el funcionamiento de la aplicación sólo mirando los test, dejando una aplicación que es muy limpia y que desde un principio se sabe qué debe hacer y cómo debe reaccionar frente a distintos escenarios.


###Usuario del seed
El usuario utiliza como correo: experto@correo.cl
como pass: expert

