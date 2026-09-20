# QS Vehicle Studio

Herramienta web para generar y administrar vehículos de **QS VehicleShop** sin conexión directa a MySQL.

Permite crear SQL para:

- `qs_vehicleshop_vehicles`: catálogo de vehículos disponibles para propietarios de concesionarios.
- `qs_vehicleshop_stock`: stock de vehículos asignados a concesionarios concretos.

Repositorio: <https://github.com/tigre437/QS-Vehicle-Studio>

## Características

- Configuración global del concesionario.
- Valores individuales por vehículo.
- Catálogo general, stock o ambos bloques SQL.
- Diferentes concesionarios dentro del mismo proyecto.
- Selección múltiple y edición masiva.
- Perfiles de precios.
- Fórmulas automáticas de precios con redondeo.
- Búsqueda, filtros y ordenación.
- Validación de precios, stock, descuento y concesionario.
- Importación de SQL existente.
- Insertar, ignorar existentes o actualizar vehículos.
- Exportación e importación de proyectos JSON.
- Guardado automático en el navegador.
- Deshacer y rehacer.
- Pestañas para revisar SQL por sección.
- Interfaz en español, inglés, francés y alemán.
- Funciona completamente en el navegador.

## Publicar en GitHub Pages

1. Abre **Settings → Pages**.
2. En **Build and deployment**, selecciona **Deploy from a branch**.
3. Selecciona:
   - **Branch:** `main`
   - **Folder:** `/ (root)`
4. Guarda la configuración.
5. Espera a que GitHub publique la página.

La dirección será parecida a:

```text
https://tigre437.github.io/QS-Vehicle-Studio/
```

`index.html` redirige automáticamente a `qs_vehicleshop_sql_generator.html`.

## Uso básico

1. Pega los modelos de vehículos en **Lista de vehículos**.
2. Selecciona si quieres generar:
   - **Catálogo general**
   - **Stock del concesionario**
   - Ambos
3. Configura los valores predeterminados.
4. Usa **Aplicar valores predeterminados a todos** para asignarlos.
5. Modifica únicamente los coches que necesiten valores especiales.
6. Genera el SQL.
7. Revisa el resultado en las pestañas:
   - Todo
   - Catálogo
   - Concesionario
8. Copia o descarga el archivo `.sql`.

## Vehículos existentes

En **Vehículos existentes** puedes elegir:

- **Insertar:** genera `INSERT` normal.
- **Ignorar existentes:** genera `INSERT IGNORE`.
- **Actualizar existentes:** actualiza la fila correspondiente y la crea si no existe.

El modo de actualización utiliza estas coincidencias:

```sql
qs_vehicleshop_vehicles.vehicle_model
qs_vehicleshop_stock.vehicleshop_id + vehicle_model
```

No depende de índices únicos en las tablas.

## Estructura SQL soportada

### Catálogo

```sql
INSERT INTO `qs_vehicleshop_vehicles`
(`vehicle_model`, `default_description`, `min_price`, `max_price`, `buy_price`, `hidden`)
```

### Stock

```sql
INSERT INTO `qs_vehicleshop_stock`
(`vehicleshop_id`, `vehicle_model`, `price`, `stock`, `unlimited_stock`, `discount`, `hidden`)
```

Esta herramienta sigue la estructura usada por `default_stores.sql`. Si tu versión de QS VehicleShop utiliza otras columnas, el SQL generado puede no ser compatible.

## Avisos importantes

- El SQL generado debe revisarse antes de ejecutarse en producción.
- Haz copia de seguridad de la base de datos antes de importar datos.
- El generador no comprueba si el `vehicleshop_id` existe realmente.
- El modo **actualizar existentes** compara por `vehicle_model`; si tu base utiliza otro identificador, no lo utilices sin revisar el SQL.
- `INSERT IGNORE` solo evita duplicados si la tabla tiene índices únicos adecuados.
- Los archivos `esx.sql` y `qbcore.sql` corresponden a vehículos propiedad de jugadores, no al catálogo de concesionario.
- Los datos introducidos se guardan localmente en el navegador. Limpia el proyecto si compartes el equipo o exporta un JSON para conservarlo.

## Archivos del proyecto

```text
index.html                                Entrada de GitHub Pages
qs_vehicleshop_sql_generator.html         Generador completo
quasar-logo.svg                           Logo de Quasar
tigre-logo.webp                           Logo personal
```

## Atajos

- `Ctrl + Enter`: generar SQL.
- `Ctrl + Z`: deshacer.
- `Ctrl + Y` o `Ctrl + Shift + Z`: rehacer.

## Privacidad

La herramienta no envía datos a ningún servidor. Todo el procesamiento se realiza localmente en el navegador y los proyectos se guardan mediante `localStorage`.
