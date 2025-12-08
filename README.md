# P3-Consultas-SQL-Ruben
## Proyecto de Análisis de Datos – Base de Datos Sakila
Este proyecto consiste en la extracción, limpieza, transformación y análisis de distintos conjuntos de datos provenientes de la base de datos Sakila, utilizando consultas SQL y un notebook en Python para el análisis estadístico del comportamiento de los clientes.

El objetivo es comprender patrones en el alquiler de películas, catálogo disponible y popularidad de actores, generando datasets limpios y listos para análisis.

## Estructura del proyecto 
| Tipo     | Archivo                  | Descripción                                                                                |
| -------- | ------------------------ | ------------------------------------------------------------------------------------------ |
| Notebook | `dataframe_1.ipynb`      | Análisis completo del dataset derivado de *actividad de clientes*.                         |
| SQL      | `actividad_clientes.sql` | Generación del dataset de actividad por cliente (alquileres, duración, pagos).             |
| SQL      | `catalogo_peliculas.sql` | Generación del dataset de catálogo de películas (categorías, rating, copias disponibles).  |
| SQL      | `elenco_popularidad.sql` | Análisis de actores por película y películas por actor.                                    |

## 1. Dataset 1 – Actividad de Clientes
| Columna           | Descripción                    |
| ----------------- | ------------------------------ |
| `customer_id`     | Identificador del cliente      |
| `customer_name`   | Nombre completo del cliente    |
| `city`, `country` | Ubicación del cliente          |
| `rental_date`     | Fecha del alquiler             |
| `return_date`     | Fecha de devolución            |
| `rental_duration` | Duración del alquiler (días)   |
| `amount`          | Pago realizado por el alquiler |

### Limpieza realizada en el notebook
El notebook ejecuta un proceso completo:

- Carga del CSV generado por la consulta.

- Revisión de tipos de datos, duplicados y valores nulos.

- Conversión de fechas a formato datetime.

Creación de métricas:

- Media de días alquilados por país

- Usuarios únicos por país

- Duración promedio por cliente

- Detección de outliers (IQR).

- Exportación del dataset limpio.

## 2. Dataset 2 – Catálogo de Películas
| Columna                          | Descripción                      |
| -------------------------------- | -------------------------------- |
| `film_id`                        | ID de la película                |
| `title`                          | Título                           |
| `film_duration`                  | Duración en minutos              |
| `is_long_film`                   | TRUE si ≥120 min                 |
| `category`                       | Categoría asignada               |
| `rental_duration`, `rental_rate` | Datos de alquiler                |
| `replacement_cost`               | Coste de reposición              |
| `rating`                         | Clasificación                    |
| `available_copies`               | Copias disponibles en inventario |

## 3. Dataset 3 – Popularidad del Elenco
### Dataframe A – Actores por película
| Columna      | Descripción                |
| ------------ | -------------------------- |
| `film_id`    | ID de la película          |
| `title`      | Título                     |
| `num_actors` | Total de actores asociados |

### Dataframe B – Películas por actor
| Columna     | Descripción                              |
| ----------- | ---------------------------------------- |
| `actor_id`  | Identificador del actor                  |
| `full_name` | Nombre completo                          |
| `num_films` | Cantidad de películas en las que aparece |

## Análisis Estadístico
El notebook profundiza exclusivamente en el dataset de actividad de clientes.
Métricas calculadas:

- Media

- Mediana

- Moda

- Desviación estándar

- Varianza

- Rango

- Mín/Máx

- Suma

- Número de registros

También se generaron:

- Gráficos de distribución

- Ranking de países según duración media

- Ranking de países según usuarios únicos

- Detección de outliers por categoría

## Visualizaciones e Insights

Incluye gráficos como:

- Barras: países con mayor duración promedio

- Boxplots: comportamiento de la variable rental_duration

- Gráfico de usuarios únicos por país

- Top clientes por gasto total (si se incluye en el notebook)

Estos insights permiten detectar patrones de comportamiento, dispersión en la duración de alquileres y posibles anomalías.

## Conclusiones principales
- Los clientes muestran moda y media de alquiler en torno a 5–6 días, con variaciones entre países.

- Se observan outliers asociados a alquileres excepcionalmente largos.

- El catálogo de películas muestra una distribución amplia en categorías, y un número importante de películas con múltiples copias.

- En el análisis de actores, la base de datos presenta películas con elencos muy variables y actores con alta presencia en múltiples títulos.

- El proceso SQL + Python permite un flujo de trabajo híbrido y eficiente para análisis más complejos.

## Requisitos previos

1. MySQL + base de datos Sakila

- Instalar MySQL 8+

- Importar la base de datos Sakila

- Ejecutar los SQL desde sql_files/

2. Python 3.10+ instalado

3. Crear y activar el entorno virtual .venv
<pre>
python -m venv .venv
.venv\Scripts\activate
</pre>
4. Instalar dependencias
<pre>pip install -r requirements.txt
</pre>
4.1 Librerías usada: ```pandas,numpy,matplotlib / seaborn,jupyter / notebook```
5. Activar entonro: ```.venv\Scripts\activate```

  
