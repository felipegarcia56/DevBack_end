# DevBack_end

Este projecto contiene los siguientes desarrollos:

- Django-python RestFull API 
- Phoenix-elixir RestFull API
- Módulo web para el consumo de la API Django.
- Módulo web para el consumo de la API Phoenix.

## Requerimientos

1. Python3.6
2. Django2.0
3. python-pip
3. Elixir
4. Phoenix Framework

## Dependencias
- para instalar los módulos de python necesarios para ejecutar el proyecto, acceder a la ruta **Django/Back-End/siftit/** desde la Ventana de comandos y ejecutar el comando **pip install -r requirements.txt**

- Las dependencias de elixir se encuentran en las carpetas de cada punto, para la Rest API, acceder a la ruta **Elixir/elixir/restAPI/config/** y ejecutar el comando **mix deps.get**.
Para el ejercicio 2 ejecutar el mismo comando en la carpeta principal del proyecto (Ejercicio2).

### Python-Django
- la app Django se encuentra desplegada en servidor Heroku, con la siguiente ruta de acceso: https://siftit.herokuapp.com/
- el desarrollo de FrontEnd se encuentra igualmente desplegado en el servidor Heroku, con la siguiente ruta de acceso: https://liftitfrontend.herokuapp.com/
- los endPoints podrán ser probados desde la webApp mencionada en el ítem anterior.
- Para el desarrollo del BackEnd se desplegaron RestFull services en Django con la librería DjangoRestFramework, los cuales son consumidos desde el FrontEnd y manipulada la información mendiante JQuery.
- La webApp es desarrollada usando HTML5, Bootstrap, JQuery y AJAX.
- la base de datos fue desarrollada en Postgresql, se encuentra dentro de la carpeta Django.
- el módulo web, se encuentra en: **Django/Front-End/liftit/**

### Elixir RestAPI
- La app elixir para la publicación de una API de tipo REST, se desarrolló mediante el uso de PHOENIX framework.  
- en la carpeta config, editar el archivo “dev.exs”, para la configuración y acceso al motor de base de datos Postgres.
- Una vez configurado el acceso a la base de datos, ejecutar en la CMD, en la carpeta principal de la API (restAPI), los comandos “mix ecto.create” y “mix ecto.migrate”, los cuales crearán la base de datos y las tablas en el motor de Postgres.
- ejecutar el comando “mix phx.server”, para levantar los servicios
- El módulo web se desarrolló de igual manera  usando HTML5, Bootstrap, JQuery y AJAX, realizando los ajustes necesarios para los requerimientos solicitados y las peticiones HTTP a la API Phoenix.
- el módulo web, se encuentra en: **Elixir/liftit/**

Para ajustar el host de destino de los request **en los dos módulos web**, ingresar a la ruta “js/services.js”, configurar la variable “var”
 e.j. **var host = "http://localhost:4000/api";**

 Para apache web server, descargar cada uno de los módulos web y ubicarlos en la ruta **C://Users/<usuario>/xampp/htdocs**

### Elixir Ejercicio 2
- Dentro de la carpeta “Elixir”, se encuentra el proyecto “Ejercicio2”.
- Para su ejecución, instalar las dependencias mediante el comando **mix deps.get**.
- Compilar el proyecto con el comando **iex -S mix**.
- Ejecutar la función list() del módulo Listtomap con la sentencia **Listtomap.list()**.
- La salida del código, es la solicitada en la prueba para el ejercicio dado.
- La ruta donde se encuentra el módulo es **/app/listomap/lib/listtomap.ex**

**