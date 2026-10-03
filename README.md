# Plataforma Editorial Revista Científica Ceibo (OJS 3.3.0-8)

Entorno de práctica y formación para la gestión editorial científica con **Open Journal Systems (OJS 3.3.0-8)** y **MariaDB 10.11**.

Diseñado para las asignaturas y talleres de posgrado en gestión editorial:
* Unidad 1: Tecnología y plataformas editoriales.
* Unidad 2: Gestión editorial con OJS y OMP (roles, envíos, revisión por pares).
* Unidad 3: Diseño, edición, maquetación, difusión y publicación de números.

---

## Despliegue Inmediato en la Nube (GitHub Codespaces)

[![Abrir en GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jorgeklz/revista-ceibo-ojs)

Puedes levantar y utilizar la revista directamente en tu navegador sin instalar Docker ni programas en tu computadora:

1. Haz clic en el botón verde **Code** (arriba a la derecha en el repositorio).
2. Selecciona la pestaña **Codespaces** y haz clic en **Create codespace on main**.
3. Espera entre 1 y 2 minutos mientras el entorno se inicializa automáticamente.
4. En cuanto los contenedores inicien, aparecerá una notificación abajo a la derecha:
   * **Open in Browser** (Abrir en el navegador).
5. Si no se abre de forma automática:
   * Ve a la pestaña **Ports** (Puertos) en la barra inferior.
   * Haz clic derecho sobre el puerto **8080** y selecciona **Port Visibility > Public**.
   * Haz clic en el icono del globo terráqueo (Open in Browser) para acceder.

---

## Usuarios y Credenciales del Sistema

Todos los usuarios tienen configurada la misma contraseña de acceso:

> **Contraseña universal para todas las cuentas:** `Ceibo2026*`

### Roles Editoriales Principales

| Usuario | Nombre Completo | Rol Asignado | Correo Electrónico |
| :--- | :--- | :--- | :--- |
| `jperez` | Dr. Juan Pérez | **Editor en Jefe / Gestor de Revista** | jperez@utm.edu.ec |
| `admin` | Administrador General | **Administrador del Sitio (SysAdmin)** | admin@revista-ceibo.utm.edu.ec |
| `mvaldez` | Dra. María Valdez | Editora de Sección (Ciencias de la Vida) | mvaldez@utm.edu.ec |
| `cmendoza` | Dr. Carlos Mendoza | Editor de Sección (Educación y Sociedad) | cmendoza@utm.edu.ec |

### Autores para Envíos

| Usuario | Nombre Completo | Especialidad / Rol | Correo Electrónico |
| :--- | :--- | :--- | :--- |
| `autor1` | Dr. Luis Morales | Autor (Envíos de Ciencias Agropecuarias) | lmorales@utm.edu.ec |
| `autor2` | Dra. Elena Zambrano | Autora (Envíos de Educación Superior) | ezambrano@utm.edu.ec |
| `autor3` | Mgs. Diego Cedeño | Autor (Envíos de Tecnología e Innovación) | dcedeno@utm.edu.ec |

### Revisores para Evaluación por Pares

| Usuario | Nombre Completo | Área de Revisión | Correo Electrónico |
| :--- | :--- | :--- | :--- |
| `revisor1` | Dr. Patricia Andrade | Revisora (Evaluación ciega por pares) | pandrade@utm.edu.ec |
| `revisor2` | Dr. Roberto Bravo | Revisor (Evaluación ciega por pares) | rbravo@utm.edu.ec |
| `revisor3` | Dra. Gabriela Moreira | Revisora (Evaluación ciega por pares) | gmoreira@utm.edu.ec |

### Equipo de Producción y Maquetación

| Usuario | Nombre Completo | Rol | Correo Electrónico |
| :--- | :--- | :--- | :--- |
| `corrector1` | Lic. Sofía Intriago | Corrección de Estilo | sintriago@utm.edu.ec |
| `maquetador1` | Ing. Kevin Párraga | Maquetador / Diseñador de Galeradas | kparraga@utm.edu.ec |

---

## Ejecución Local en Computadora (Alternativa con Docker Desktop)

Si prefieres ejecutar la plataforma en tu computadora sin conexión a internet:

1. Clona o descarga esta carpeta.
2. Abre la terminal en esta ubicación.
3. Ejecuta el comando:
   ```bash
   docker compose up -d
   ```
4. Abre tu navegador web e ingresa a:
   [http://localhost:8080](http://localhost:8080)
5. Para detener la plataforma cuando termines la práctica:
   ```bash
   docker compose stop
   ```

---

## Características Técnicas Configuradas

* **OJS 3.3.0-8 LTS**: Versión estable con interfaz responsiva, flujo editorial completo y soporte multiidioma (Español configurado por defecto).
* **Parches de Compatibilidad**: Soporte completo para renderizado de citas y referencias bibliográficas sin cortes de caracteres.
* **Galeradas y Artículos Preinstalados**: 9 artículos de ejemplo completos con PDFs accesibles para ejercicios de maquetación y publicación.
