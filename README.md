# CRUD Anime

Mi trabajo de CRUD es una lista de anime en la que se pueden agregar nuevos animes, editar alguno ya existente, borrar un anime de la lista o ver mas detalles de anime.

## Componentes y estilo

Para el estilo he utilizado la siguiente [plantilla](https://www.tutorialrepublic.com/snippets/preview.php?topic=bootstrap&file=crud-data-table-for-database-with-modal-form), modificando y agregando botones y una barra de busqueda, en la parte superior derecha podemos encontrar un botón el cual sirve para agregar un nuevo anime a la lista, para cada entrada de la lista tenemos 3 botones en la columna de 'Acciones', uno para editar los datos de esa entrada, otro para borrar la entrada y un último botón para ver más información sobre la entrada.

<img src="capturas-CRUD/01-Pagina Principal.png">

## Agregar un nuevo anime

Al pulsar en el botón de agregar un nuevo anime, se despliega un Modal con el formulario necesario para agregar un nuevo anime a la lista, todos los campos son obligatorios. Al final del Modal, hay 3 botones, uno de 'Cancelar' que vuelve a la lista, otro de 'Reset' que limpia todos los campos del formulario y otro de 'Agregar' que añade el anime a la lista.Los campos son los siguientes:

    - <b>Nombre:</b> Es el nombre del anime, campo tipo 'text'.
    - <b>Tipo:</b> Es el tipo de anime, campo 'select'.
    - <b>Generos:</b> Son los generos del anime, campo tipo 'text'.
    - <b>Sinopsis:</b> Es la descripción del anime, es un 'textarea'.
    - <b>Número de Episodios:</b> Es el número de episodios que tiene el anime, campo tipo 'number'.
    - <b>Duración de los episodios (en minutos):</b> Es la duración de los episodios del anime en minutos, campo tipo 'number'.
    - <b>Fecha de estreno:</b> Es la fecha en la que se empezó a emitir el anime, campo tipo 'date'.
    - <b>Estudio:</b> Es el nombre delestudio de animación que creó el anime, campo tipo 'text'.

<img src="capturas-CRUD/02-1-Modal agregar anime.png">
<img src="capturas-CRUD/02-2-Botones modal agregar anime.png">