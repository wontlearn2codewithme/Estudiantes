# Estudiantes
Proyecto para prueba técnica de GoSupply

Esta solución consta de tres proyectos implementando una arquitectura de dominio por capas. Los proyectos son: 
- Estudiantes: proyecto API con documentación Swagger y autenticación JWT
- EstudiantesRepository: Proyecto de acceso a la base de datos
- EstudiantesService: Proyecto en el que se aplica la lógica de negocio

La autenticación en la aplicación se basa en autenticación JWT mediante usuario y contraseña. Estos se han de especificar en el método login de AuthController. El usuario predefinido es test y la contraseña es test. Una vez hecha esta petición como respuesta obtendremos un token que deberemos insertar en la pestaña de autorización de swagger, añadiendo la palabra Bearer delante.

El fichero script.sql es para la generación de base de datos.

El método del controlador GetNumEstudiantesByProvincia es para ejecutar el ejercicio 1

El método del controlador GetProvinciaConMasEstudiantesByCurso es para ejecutar el ejercicio 2

El método del controlador GetNumEstudiantesPorDocente es para ejecutar el ejercicio 3

Se ha usado el sistema DBFirst para obtener las entidades del proyecto. El comando ejecutado es el siguiente:
dotnet ef dbcontext scaffold "Server=ALC-CSYF1F3\DESARROLLO;Initial Catalog=Estudiantes;Integrated Security=True;" Microsoft.EntityFrameworkCore.SqlServer -o Entities -f -c DomainDbContext --context-dir Context --use-database-names --project EstudiantesRepository --schema dbo --no-pluralize

